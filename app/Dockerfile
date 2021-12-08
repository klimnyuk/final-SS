FROM php:8.0-apache

COPY . /var/www/html/

RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

EXPOSE 80

ARG dbhost
ARG dbuser
ARG dbpass
ARG dbname

ENV dbhost ${dbhost}
ENV dbuser ${dbuser}
ENV dbpass ${dbpass}
ENV dbname ${dbname}