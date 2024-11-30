#!/bin/bash

sed -e

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" > /var/lib/mysql/init.sql
echo -e "create databese"
echo "CREATE USER IF NOT EXISTS '$DB_USER' IDENTIFIED BY '$DB_PWD';" >> /var/lib/mysql/init.sql
echo -e "create user"
echo "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';" >> /var/lib/mysql/init.sql
echo -e "add priv"
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';" >> /var/lib/mysql/init.sql
# echo "ALTER USER 'root'@'localhost' IDENTIFIED USING PASSWORD('root');" >> /var/lib/mysql/init.sql
echo -e $DB_ROOT_PWD
echo "FLUSH PRIVILEGES;" >> /var/lib/mysql/init.sql
echo -e 'flush'
#mysqlサービスを起動
# mysqld --init-file=/var/lib/mysql/init.sql

mysqld_safe &
sleep 5

mysql < /var/lib/mysql/init.sql

# kill $(cat /var/run/mysqld/mysqld.pid)
mysqladmin shutdown -uroot -proot


# #mysqlデーモンをフォアグラウンドで起動させる
exec mysqld_safe 