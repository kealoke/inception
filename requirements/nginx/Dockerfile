FROM debian:latest

RUN apt-get update && apt-get upgrade -y && \ 
    apt-get install -y nginx curl


COPY ./conf/default /etc/nginx/sites-available/default

RUN mkdir -p /run/nginx


CMD ["nginx", "-g", "daemon off;"]
