#!/bin/sh

username=$WP_USERNAME
userpwd=$(cut -f2 /run/secrets/wp-user-password)
adminuser=$(cut -f2 /run/secrets/wp-admin-user)
adminpwd=$(cut -f2 /run/secrets/wp-admin-password)
dbname=$(cut -f2 /run/secrets/db-user)
dbpwd=$(cut -f2 /run/secrets/db-password)

if ! [ -e /var/www/html/wp-config.php ]; then
    cd /var/www/html
    rm -rf /var/www/html/*

    if ! [ -e /usr/local/bin/wp ]; then
        curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
        chmod +x wp-cli.phar
        mv wp-cli.phar /usr/local/bin/wp
    fi
    wp core download --allow-root
    wp config create --dbname=wordpress --dbuser=$dbname --dbpass=$dbpwd --dbhost=mariadb --allow-root
    wp core install --url=$DOMAIN_NAME --title=inception --admin_user=$adminuser --admin_password=$adminpwd --admin_email=$adminuser@example.com --allow-root
    wp user create $username $username@example.com --role=author --user_pass=$userpwd --allow-root
    wp theme install twentysixteen --activate --allow-root
else
    echo "Wordpress already installed"
fi

exec "php-fpm8.2" "-F"