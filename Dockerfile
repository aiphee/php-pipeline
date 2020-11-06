FROM php:7.3-cli-alpine

RUN apk update
RUN apk add gnu-libiconv --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php
RUN apk add --no-cache openssh \
  unzip \
  git \
  mysql-client libpng libpng-dev \
  jpeg-dev libjpeg-turbo libjpeg-turbo-dev \
  freetype \
	freetype-dev


RUN docker-php-ext-install gd
RUN docker-php-ext-configure gd \
        --with-gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/

RUN docker-php-ext-install -j "$(nproc)" mbstring mysqli pdo pdo_mysql
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
