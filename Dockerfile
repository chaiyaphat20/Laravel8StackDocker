#load images php 8.0.3  #buster have many extension
FROM php:8.0.3-fpm-buster

#คำสั่ง ติดตั้ง extension bcmath และ pdo_mysql สำหรับ Larevel 7 8 9 and 10
RUN docker-php-ext-install bcmath pdo_mysql

# สั่ง update image และ ติดตั้ง git zip และ unzip pacakage
RUN apt-get update -y
RUN apt-get install  git zip unzip -y

# ติดตั้ง NodeJS
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

# Copy file (image) composer:latest ไว้ที่ /usr/bin/composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

EXPOSE 9000
