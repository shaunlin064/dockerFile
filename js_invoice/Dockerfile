FROM shaunlin064/php5.6_apache
RUN docker-php-ext-install mysqli pdo pdo_mysql mysql
RUN a2enmod rewrite

RUN docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-install mysqli pdo pdo_mysql mysql zip
RUN a2enmod rewrite

EXPOSE 80

WORKDIR /var/www/html


