#!/bin/bash

docker exec -i mysql mysql -u root -proot -e 'CREATE DATABASE IF NOT EXISTS `paris-jo`'
docker exec -i mysql mysql -u root -proot paris-jo < paris-jo.sql
