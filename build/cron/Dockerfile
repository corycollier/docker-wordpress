FROM wordpress:cli-php8.2
MAINTAINER corycollier@corycollier.com

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY config/custom.php.ini /usr/local/etc/php/conf.d/custom.php.ini
COPY config/cron-wordpress /app/cron-wordpress
COPY dotfiles/.* /root/
COPY scripts/* /usr/local/bin

RUN touch /var/log/cron.log \
    && chown www-data /var/log/cron.log

USER www-data
RUN crontab /var/www/html/cron-wordpress

WORKDIR /var/www/html

USER root
CMD cron -f
