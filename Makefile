SSL_CRT = secrets/selfsigned.crt
SSL_KEY = secrets/selfsigned.key
SECRET_VARS = db_pwd wp_admin_n wp_admin_p wp_admin_e wp_user_p
SECRET_FILES = $(addsuffix .txt, $(addprefix secrets/, $(SECRET_VARS)))
ENVIRONMENT = srcs/.env

all: $(SSL_CRT) $(SECRET_FILES) $(ENVIRONMENT)
	@make --no-print-directory help

$(SSL_CRT): $(SSL_KEY)

$(SSL_KEY):
	@mkdir -p secrets
	@openssl req -q -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=C Inc/CN=e.com" -newkey rsa:2048 -keyout $(SSL_KEY) -out $(SSL_CRT)


secrets/%.txt:
	@printf "$$(printf $* | tr a-z A-Z)=<value>" > $@

$(ENVIRONMENT):
	@mkdir -p $(dir $@)
	@printf "#Mariadb related environment variables\n\
	DB_USER=<value>\n\
	DB_NAME=<value>\n\
	\n\
	#Waordpress related environment variables\n\
	DOMAIN_NAME=<value>\n\
	WP_TITLE=<value>\n\
	\n\
	#Waordpress user\n\
	WP_USER_N=<value>\n\
	WP_USER_E=<value>\n\
	WP_USER_R=<value>\n" > $@

up:
	docker compose -f srcs/docker-compose.yml up --build -d

debug:
	docker compose -f srcs/docker-compose.yml up --build

down: 
	docker compose -f srcs/docker-compose.yml down

access:
	@docker exec -ti $(CONTAINER) sh

clean: down
	docker system prune -af
	docker volume prune -f

fclean: clean
	rm -fr secrets
	rm srcs/.env
	sudo rm -rf /home/$(USER)/data

re: clean up

.PHONY: all help up debug info value