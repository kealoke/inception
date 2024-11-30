#!/bin/bash

# MariaDBデータディレクトリの初期化

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
fi


sed -e

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" > /var/lib/mysql/init.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD';" >> /var/lib/mysql/init.sql
echo "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';" >> /var/lib/mysql/init.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PWD';" >> /var/lib/mysql/init.sql
echo "FLUSH PRIVILEGES;" >> /var/lib/mysql/init.sql
#mysqlサービスを起動
mysqld_safe --datadir=/var/lib/mysql &
sleep 5
mysql -uroot -p$DB_ROOT_PWD < /var/lib/mysql/init.sql

# kill $(cat /var/run/mysqld/mysqld.pid)
mysqladmin shutdown -uroot -p$DB_ROOT_PWD

# #mysqlデーモンをフォアグラウンドで起動させる
exec mysqld_safe 