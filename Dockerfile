FROM php:7.2.14-fpm
MAINTAINER leekachung  <leekachung17@gmail.com>

WORKDIR /www

ENV TZ=Asia/Shanghai

RUN apt-get update && apt-get install -y libmcrypt-dev libmemcached-dev mcrypt libbz2-dev libpng-dev \
  && docker-php-ext-install bcmath opcache bz2 gd iconv mysqli pdo pdo_mysql zip \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/pear ~/.pearrc \

COPY sources.list /etc/apt/sources.list
COPY php.ini /usr/local/etc/php/conf.d/
