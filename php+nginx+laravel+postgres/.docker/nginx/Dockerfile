# https://medium.com/@vhsilva.ap/configurando-laravel-6-nginx-e-postgresql-com-docker-9ad29c53d5

FROM nginx:1.15.0-alpine

RUN apk update && apk add bash

RUN rm /etc/nginx/conf.d/default.conf

COPY ./nginx.conf /etc/nginx/conf.d
#COPY ./nginx.conf /etc/nginx/conf.d/nginx.conf

