FROM debian:latest

RUN apt-get update && apt-get upgrade -y && \ 
    apt-get install -y php-fpm php-mysqli curl net-tools

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/.
COPY script.sh .

RUN chmod +x script.sh

CMD ["./script.sh"]
