FROM wordpress:latest
MAINTAINER corycollier@corycollier.com

RUN apt update -y \
    && apt upgrade -y \
    && apt autoremove -y

RUN pecl install redis

COPY config/custom.php.ini /usr/local/etc/php/conf.d/custom.php.ini
