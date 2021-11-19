FROM php:7.4-cli
MAINTAINER corycollier@corycollier.com


RUN apt -y update && \
    apt -y upgrade && \
    apt -y install \
        git \
        vim \
        bash \
        cron \
        curl \
        less \
        wget \
        unzip \
        gnupg2 \
        python \
        sqlite3 \
        binutils \
        colordiff \
        net-tools \
        libpng-dev \
        libgmp-dev \
        libzip-dev \
        zlib1g-dev \
        libxslt-dev \
        libjpeg-dev \
        lsb-release \
        libmcrypt-dev \
        libsqlite3-dev \
        mariadb-backup \
        ca-certificates \
        libfreetype6-dev \
        python-setuptools \
		libjpeg62-turbo-dev \
        apt-transport-https \
        default-mysql-client \
        libperl4-corelibs-perl

# Add all of the php specific packages
RUN docker-php-source extract \
    && docker-php-ext-configure gd \
        --enable-gd-jis-conv \
        --with-jpeg=/usr/include/ \
        --with-freetype=/usr/include/ \
    && docker-php-ext-install \
        gd \
        gmp \
        pdo \
        xsl \
        zip \
        exif \
        pcntl \
        bcmath \
        mysqli \
        pdo_mysql \
        pdo_sqlite

# Install modules not able to be installed any other way
RUN pecl install xdebug redis \
    && echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini \
    && rm -rf /tmp/pear

# Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY config/custom.php.ini /usr/local/etc/php/conf.d/custom.php.ini
COPY config/cron-wordpress /etc/cron.d/
COPY dotfiles/.* /root/

WORKDIR /app
CMD [ "cron", "-f" ]
