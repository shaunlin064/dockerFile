FROM php:7.3-fpm

RUN apt-get update && apt-get install -yq libzip-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libssl-dev \
    libmemcached-dev \
    libz-dev \
    libsqlite3-dev \
    libxml2-dev \
    libcurl3-dev \
    libedit-dev \
    libpspell-dev \
    libldap2-dev \
    libbz2-dev \
    libicu-dev \
    libpng-dev \
    libsodium-dev \
    libssh2-1-dev \
    libxslt1-dev \
    unixodbc-dev \
    libpq-dev \
    zlib1g-dev \
    wget \
    git \
    zip \
    vim \
    sudo \
    cron \
    net-tools \
    iputils-ping \
    procps \
    systemd \
    supervisor \
    nodejs \
    npm \
    cron \
    gzip \
    lsof \
    default-mysql-client

# composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

#docker ext
RUN docker-php-ext-install -j$(nproc) \
    gd \
    bcmath \
    bz2 \
    calendar \
    exif \
    gd \
    gettext \
    gmp \
    imap \
    intl \
    ldap \
    mbstring \
    mysqli \
    opcache \
    pcntl \
    pdo \
    pdo_mysql \
    pspell \
    recode \
    soap \
    sockets \
    sodium \
    sysvmsg \
    sysvsem \
    sysvshm \
    tidy \
    tokenizer \
    xmlrpc \
    xsl \
    zip

RUN docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-configure intl bcmath

RUN cd /tmp \
  && curl -O https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz \
  && tar zxvf ioncube_loaders_lin_x86-64.tar.gz \
  && export PHP_VERSION=$(php -r "echo PHP_MAJOR_VERSION.'.'.PHP_MINOR_VERSION;") \
  && export PHP_EXT_DIR=$(php-config --extension-dir) \
  && cp "./ioncube/ioncube_loader_lin_${PHP_VERSION}.so" "${PHP_EXT_DIR}/ioncube.so" \
  && rm -rf ./ioncube \
  && rm ioncube_loaders_lin_x86-64.tar.gz \
  && docker-php-ext-enable ioncube

RUN pecl channel-update pecl.php.net

RUN pecl install -o -f gnupg \
    igbinary \
    imagick \
    mailparse \
    msgpack \
    oauth \
    pcov \
    propro \
    raphf \
    redis \
    ssh2-1.1.2 \
    xdebug \
    yaml \
    memcached
    && docker-php-ext-enable memcached

RUN docker-php-ext-enable xdebug \
  && sed -i -e 's/^zend_extension/\;zend_extension/g' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini



## Replace next lines with below commented out version once issue is resolved
# https://github.com/php/pecl-networking-ssh2/pull/36
# https://bugs.php.net/bug.php?id=78560
RUN curl -o /tmp/ssh2-1.2.tgz https://pecl.php.net/get/ssh2 \
  && pear install /tmp/ssh2-1.2.tgz \
  && rm /tmp/ssh2-1.2.tgz \
  && docker-php-ext-enable ssh2
#RUN pecl install ssh2-1.2 \
#  && docker-php-ext-enable ssh2


#timeZone
ENV TZ=Asia/Taipei
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

# nvm node npm
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.35.2/install.sh | bash
ENV NVM_DIR /root/.nvm
ENV NODE_VERSION v12.14.0
RUN /bin/sh -c ". ~/.bashrc"
RUN . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

#supervisor
RUN chmod 777 /run && chmod 777 /var/log && touch /var/run/supervisor.sock && chmod 777 /var/run/supervisor.sock && touch /var/log/supervisor/worker.log && chmod 777 /var/log/supervisor/worker.log