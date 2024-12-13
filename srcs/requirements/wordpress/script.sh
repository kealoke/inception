#!/bin/bash

if [ -f /run/secrets/db_password ]; then
    export DB_PWD=$(cat /run/secrets/db_password)
fi

if [ -f /run/secrets/db_root_password ]; then
    export DB_ROOT_PWD=$(cat /run/secrets/db_root_password)
fi

if [ -f /run/secrets/wp_admin_password ]; then
    export WP_ADMIN_PWD_PWD=$(cat /run/secrets/wp_admin_password)
fi


mkdir -p /var/www/
mkdir -p /var/www/html/
mkdir -p /var/www/html/web
chown -R www-data:www-data /var/www/html/web
chmod -R 755 /var/www/html/web
cd /var/www/html/web
rm -rf *
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp


if [ -z "$DB_NAME" ] || [ -z "$DB_USER" ] || [ -z "$DB_HOST" ] || [ -z "$DB_PWD" ] || [ -z "$WP_TITLE" ] || [ -z "$WP_ADMIN_USER" ] || [ -z "$WP_ADMIN_EMAIL" ]; then
    echo "Error: One or more required environment variables are not set."
    exit 1
fi


wp core download --allow-root --path=/var/www/html/web

wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PWD  --dbhost=$DB_HOST --allow-root

wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

#フォアグラウンドで起動
php-fpm7.4 -F