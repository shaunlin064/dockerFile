#!/bin/bash

docker exec -i mysql mysql -uroot -pau4a83js -e 'CREATE DATABASE data_analysis_control CHARACTER SET utf8 COLLATE utf8_unicode_ci;'

docker exec -i dac npm install
docker exec -i dac npm run prod
docker exec -i dac composer install
docker exec -i dac composer dumpautoload
docker exec -i dac php artisan migrate:refresh --seed && docker exec -i dac php artisan set_reload;

vi /var/project/dataanalysiscontrol/app/Providers/AuthServiceProvider.php
