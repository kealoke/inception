FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && \ 
    apt-get install -y nginx curl openssl

COPY ./conf/default.conf /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/ssl

#秘密鍵の作成
#CSRの作成
#CRTの作成

RUN openssl genrsa -out /etc/nginx/ssl/server.key 2048 && \
    openssl req -new -key /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.csr -subj "/C=JP/ST=Tokyo/L=Shinjuku-ku/O=42-Tokyo/OU=42cursus/CN=yusjimom.42.fr" && \
    openssl x509 -days 3650 -req -signkey /etc/nginx/ssl/server.key -in /etc/nginx/ssl/server.csr -out /etc/nginx/ssl/server.crt

CMD ["nginx", "-g", "daemon off;"]
