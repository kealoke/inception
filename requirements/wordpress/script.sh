#!/bin/bash
mkdir /var/www/
mkdir /var/www/html
cd /var/www/html
rm -rf *
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root --path=/var/www/html

wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PWD  --allow-root
wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root --allow-root

wp theme install Bute --activate --allow-root

# wp plugin install redis-cache --activate --allow-root
# wp plugin update --all --allow-root
# wp redis enable --allow-root


php-fpm8.2 -F