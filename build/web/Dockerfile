FROM wordpress:php8.2
MAINTAINER corycollier@corycollier.com

COPY config/custom.php.ini /usr/local/etc/php/conf.d/custom.php.ini
COPY config/apache.host.conf /etc/apache2/sites-available/000-default.conf
COPY config/apache.security.conf /etc/apache2/conf-enabled/security.conf

WORKDIR /var/www/html
