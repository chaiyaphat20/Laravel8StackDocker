1.ลง Images
#load images php 8.0.3  #buster have many extension
FROM php:8.0.3-fpm-buster

1.หากอยากรู้ว่าใน images นั้นมี modules อะไรบ้างให้ใช้
$ docker pull php:8.0.3-fpm-buster
$ docker run php:8.0.3-fpm-buster php -m

**จะพบว่า module ใน php มีเยอะมาก

2.ติดตั้ง extension bcmath และ pdo_mysql สำหรับ Larevel 7 8 9 and 10
RUN docker-php-ext-install bcmatch pdo_mysql

3.COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
ที่ชอบใส่ /usr/bin/composer 2 อันเพราะ linux ชอบหา path ไม่เจอ

4.กำหนด nginx

5.docker-compose up -d

6.docker-compose down  rmi all

7.ติดตั้ง Lib ของ Laravel ใน server app

8.เข้าไปดู container app
8.1 check node -version
docker-compose exec app node -v
docker-compose exec app php atisan
docker-compose exec app composer -v

9.ลงโปรแกรม composer 
docker-compose exec app composer install

10. Add file .env แล้ว copy data from .env.example

สร้าง Key
11. docker-compose exec app php artisan key:generate

12. connect db ที่ .env   #host คือ services  #port คือ port ใน linux
DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=laravel8db
DB_USERNAME=admin
DB_PASSWORD=1234

13.ทำ migration
- เบื้องต้น clear คำสั่ง config env
docker-compose exec app php artisan config:clear

$ docker-compose exec app php artisan migrate


