FROM php:8.0-apache

COPY ./app/ /var/www/html/

RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
EXPOSE 80