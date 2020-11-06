FROM php:7.3-fpm

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# make sure apt is up to date
RUN apt-get update --fix-missing
RUN apt-get install -y 
RUN apt-get install -y build-essential libssl-dev zlib1g-dev libpng-dev libjpeg-dev libfreetype6-dev \
	curl \
	git \
	unzip \
	default-mysql-client

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd 

RUN docker-php-ext-install pdo pdo_mysql mysqli mbstring

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN usermod -u 1000 www-data
