FROM php:7.1-cli-alpine3.7

RUN apk update
RUN apk add --no-cache openssh unzip git mysql-client
RUN docker-php-ext-install mbstring mysqli pdo pdo_mysql
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer