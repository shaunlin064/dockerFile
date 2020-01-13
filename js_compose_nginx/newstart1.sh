#!/bin/bash

cd /home/shaun

apt-get update -y && apt-get install docker docker-compose -y

git clone git@bitbucket.org:shaunJs-adways/jsdockerfile.git

rm /home/shaun/jsdockerfile/js_compose_nginx/.env
touch /home/shaun/jsdockerfile/js_compose_nginx/.env
echo "STORAGE_PATH=/var/project" >> ./jsdockerfile/js_compose_nginx/.env

mkdir /var/project && cd /var/project/ && git clone git@bitbucket.org:shaunJs-adways/dataanalysiscontrol.git

cd /home/shaun/jsdockerfile/js_compose_nginx && docker-compose up -d && vi /var/project/dataanalysiscontrol/app/Providers/AuthServiceProvider.php

