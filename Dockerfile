FROM php:7.2-apache

ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/

RUN chmod uga+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions gd intl imagick pgsql mysqli pdo_mysql ldap soap zip opcache apcu

#add lat reqs
#RUN apt update -y && apt install -y --no-install-recommends  texlive-latex-extra zbar-tools && \
COPY php.ini "$PHP_INI_DIR/php.ini" 
RUN  rm -rf /var/lib/apt/lists/*

#official Code
ARG VERSION=1.11.10
ARG DIRECTORY=chamilo
ADD https://github.com/chamilo/chamilo-lms/releases/download/v${VERSION}/chamilo-${VERSION}-php7.2.tar.gz /tmp/
RUN a2enmod rewrite && \
    chown -R www-data:www-data /tmp/chamilo-${VERSION}-php7.2.tar.gz
USER www-data
RUN tar -xzf /tmp/chamilo-${VERSION}-php7.2.tar.gz -C /var/www/html/ && \
    mv /var/www/html/chamilo-${VERSION} /var/www/html/${DIRECTORY} && \
    rm /tmp/chamilo-${VERSION}-php7.2.tar.gz
USER root
#COPY . /var/www/html/${DIRECTORY}

#fix instalation 
VOLUME ["/var/www/html/${DIRECTORY}/vendor", "/var/www/html/${DIRECTORY}/main/default_course_document/images", "/var/www/html/${DIRECTORY}/main/lang", "/var/www/html/${DIRECTORY}/web", "/var/www/html/${DIRECTORY}/app"]
