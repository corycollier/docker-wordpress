FROM wordpress:latest
MAINTAINER corycollier@corycollier.com

RUN apt update -y \
    && apt upgrade -y \
    && apt install -y \
        less \
    && apt autoremove -y

RUN pecl install redis

COPY config/custom.php.ini /usr/local/etc/php/conf.d/custom.php.ini
COPY config/custom.apache.conf /etc/apache2/sites-available/000-default.conf
COPY dotfiles/* /root/

WORKDIR /var/www/html
