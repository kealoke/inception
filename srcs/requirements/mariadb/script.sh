#!/bin/bash

if [ -f /run/secrets/db_password ]; then
    export DB_PWD=$(cat /run/secrets/db_password)
fi

if [ -f /run/secrets/db_root_password ]; then
    export DB_ROOT_PWD=$(cat /run/secrets/db_root_password)
fi

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
fi

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" > /var/lib/mysql/init.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD';" >> /var/lib/mysql/init.sql
echo "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';" >> /var/lib/mysql/init.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PWD';" >> /var/lib/mysql/init.sql
echo "FLUSH PRIVILEGES;" >> /var/lib/mysql/init.sql

echo "DB --dbname=$DB_NAME --dbuser=$DB_USER --dbhost=$DB_HOST"


mysqld_safe --datadir=/var/lib/mysql  &
sleep 5

mysql -uroot -p$DB_ROOT_PWD < /var/lib/mysql/init.sql

mysqladmin shutdown -uroot -p$DB_ROOT_PWD

exec mysqld_safe