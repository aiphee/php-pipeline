FROM php:7.3-cli-alpine

RUN apk update
RUN apk add gnu-libiconv --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php
RUN apk add --no-cache openssh unzip git mysql-client libpng libpng-dev jpeg-dev libjpeg libjpeg-turbo-dev
RUN docker-php-ext-install mbstring mysqli pdo pdo_mysql gd
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
