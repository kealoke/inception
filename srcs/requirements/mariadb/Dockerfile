FROM debian:bullseye

USER root

RUN apt-get update && apt-get upgrade -y && \ 
    apt-get install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN mkdir -p /run/mysql /run/mysqld && \
    chown -R mysql:mysql /run/mysql /run/mysqld  /var/lib/mysql && \
    chmod 755 /run/mysql /run/mysqld

COPY script.sh .
RUN chmod +x script.sh

EXPOSE 3306

ENTRYPOINT ["/bin/bash", "./script.sh"]
