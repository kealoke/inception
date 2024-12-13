# FROM debian:latest

# RUN apt-get update && apt-get upgrade -y && \ 
#     apt-get install -y mariadb-server

# COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
# COPY script.sh .
# RUN chmod +x script.sh

# EXPOSE 3306

# CMD ["./script.sh"]

FROM debian:bullseye

USER root

RUN apt-get update && apt-get upgrade -y && \ 
    apt-get install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN mkdir -p /run/mysql/
RUN chown -R mysql:mysql /run/mysql/
RUN chmod 755 /run/mysql/

RUN mkdir -p /run/mysqld/
RUN chown -R  mysql:mysql /run/mysqld/
RUN chmod 755 /run/mysqld/

RUN chown -R mysql:mysql /var/lib/mysql

COPY script.sh .
RUN chmod +x script.sh

EXPOSE 3306

CMD ["./script.sh"]
