FROM debian:bullseye

USER root

RUN apt-get update && apt-get upgrade -y && \ 
    apt-get install -y php7.4-fpm php7.4-mysqli curl 

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /run/php && \
chown www-data:www-data /run/php


COPY script.sh .
RUN chmod +x script.sh

ENTRYPOINT ["/bin/bash", "./script.sh"]
