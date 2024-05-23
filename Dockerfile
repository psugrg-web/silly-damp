FROM php:8.2-apache 

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    apt-utils \
    sudo \
    unzip \
    wget

RUN docker-php-ext-install \
    mysqli

RUN a2enmod rewrite
RUN a2enmod ssl
RUN service apache2 restart

EXPOSE 80