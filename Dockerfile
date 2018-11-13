FROM php:apache

ADD 000-default.conf /etc/apache2/sites-available/
ADD default-ssl.conf /etc/apache2/sites-available/

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y zlib1g-dev && \
    a2enmod rewrite && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-install zip pdo pdo_mysql && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === '93b54496392c062774670ac18b134c3b3a95e5a5e5c8f1a9f115f203b75bf9a129d5daa8ba6a13e2cc8a1da0806388a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    php composer.phar global require laravel/installer && \
    /bin/mv composer.phar /usr/local/bin/composer && \
    /usr/local/bin/composer create-project laravel/laravel /var/www/laravel --prefer-dist && \
    /bin/chown www-data:www-data -R /var/www/laravel/storage /var/www/laravel/bootstrap/cache

EXPOSE 80
EXPOSE 443
