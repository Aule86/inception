DOCKER_COMPOSE	= srcs/docker-compose.yml

SECRETS_DIR	= secrets/

SSL_CERT	= $(SECRETS_DIR)self-signed.crt

DATA_DIR	= /home/aszamora/data
DATABASE	= $(DATA_DIR)/database
SITE		= $(DATA_DIR)/web
ENV			= srcs/.env

SECRETS_LIST_PRE = db-user db-password wp-admin-user wp-admin-password wp-user-password
SECRETS_LIST = $(addprefix $(SECRETS_DIR), $(SECRETS_LIST_PRE))

all: build

$(ENV):
	touch $(ENV)
	echo 'DOMAIN_NAME: "aszamora.42.fr"' >> $(ENV)
	echo 'WP_USERNAME: "user"' >> $(ENV)

$(SECRETS_LIST):
	touch $(SECRETS_LIST)


$(SSL_CERT):
	sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $(SECRETS_DIR)self-signed.key -out $(SSL_CERT) -subj "/C=ES/ST=Bizkaia/L=Urduliz/O=42Urduliz/CN=localhost"

build: $(ENV) $(SSL_CERT) $(SECRETS_LIST) $(DATABASE) $(SITE)
	sudo docker compose -f $(DOCKER_COMPOSE) build

$(DATABASE): $(DATA_DIR)
	mkdir -p $@

$(SITE): $(DATA_DIR)
	mkdir -p $@

$(DATA_DIR):
	mkdir -p $@

up:
	sudo docker compose -f $(DOCKER_COMPOSE) up -d

down: 
	sudo docker compose -f $(DOCKER_COMPOSE) down

clean: down
	sudo docker volume rm -f database
	sudo docker volume rm -f site
	sudo rm -rf $(DATA_DIR)/*

fclean:
	sudo docker rm -f wordpress nginx redis wordpress
	rm -rf $(SECRETS_DIR) $(ENV)

re: clean all