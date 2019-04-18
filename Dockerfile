FROM php:7.2.14-fpm
MAINTAINER leekachung  <leekachung17@gmail.com>

WORKDIR /www

ENV TZ=Asia/Shanghai

RUN apt-get update && apt-get install -y libmcrypt-dev  mcrypt libbz2-dev libpng-dev libjpeg62-turbo-dev libfreetype6-dev \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install -j$(nproc) gd \
  && docker-php-ext-install bcmath opcache bz2 iconv mysqli pdo pdo_mysql zip \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/pear ~/.pearrc \

COPY sources.list /etc/apt/sources.list
COPY php.ini /usr/local/etc/php/conf.d/
