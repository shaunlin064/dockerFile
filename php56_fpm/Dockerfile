FROM php:5.6-fpm

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

#timeZone
ENV TZ=Asia/Taipei
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

# composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# nvm node npm
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.35.2/install.sh | bash
ENV NVM_DIR /root/.nvm
ENV NODE_VERSION v13.11.0
RUN /bin/sh -c ". ~/.bashrc"
RUN . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

#copy phpini
COPY php.ini /usr/local/etc/php/

#memcache
WORKDIR /var
RUN wget https://github.com/php-memcached-dev/php-memcached/archive/r2.1.0.tar.gz && tar xvf r2.1.0.tar.gz
RUN rm r2.1.0.tar.gz
RUN cd /var/php-memcached-r2.1.0 && phpize && ./configure '--with-libmemcached-dir=/usr' && make && make install
RUN echo "extension=memcached.so" >> /usr/local/etc/php/php.ini

RUN docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-install mysqli pdo pdo_mysql mysql zip


