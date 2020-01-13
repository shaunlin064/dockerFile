FROM php:5.6-apache

RUN apt-get update && apt-get install -y libzip-dev zip git libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libssl-dev \
    libmemcached-dev \
    libz-dev \
    zlib1g-dev \
    libsqlite3-dev \
    libxml2-dev \
    libcurl3-dev \
    libedit-dev \
    libpspell-dev \
    libldap2-dev \
    unixodbc-dev \
    libpq-dev \
    wget \
    vim

WORKDIR /var

RUN wget https://github.com/php-memcached-dev/php-memcached/archive/r2.1.0.tar.gz && tar xvf r2.1.0.tar.gz
RUN rm r2.1.0.tar.gz
RUN cd /var/php-memcached-r2.1.0 && phpize && ./configure '--with-libmemcached-dir=/usr' && make && make install
RUN echo "extension=memcached.so" >> /usr/local/etc/php/php.ini

RUN docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-install mysqli pdo pdo_mysql mysql zip
RUN a2enmod rewrite

EXPOSE 80

WORKDIR /var/www/html

HEALTHCHECK --interval=5s --timeout=3s --retries=3 CMD curl -f http://localhost || exit 1

CMD apachectl -D FOREGROUND
