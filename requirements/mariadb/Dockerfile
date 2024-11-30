# FROM debian:latest

# RUN apt-get update && apt-get upgrade -y && \ 
#     apt-get install -y mariadb-server

# COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
# COPY script.sh .
# RUN chmod +x script.sh

# EXPOSE 3306

# CMD ["./script.sh"]

FROM debian:latest

USER root

RUN apt-get update && apt-get upgrade -y && \ 
apt-get install -y mariadb-server 

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN mkdir /run/mysql/
RUN chown mysql:mysql /run/mysql/
RUN chmod 755 /run/mysql/

COPY script.sh .
RUN chmod +x script.sh


EXPOSE 3306

ENTRYPOINT ["./script.sh"]

# ENTRYPOINT  ["sh", "-c", "while :; do sleep 30; done"]

