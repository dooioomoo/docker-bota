@echo off

docker-compose -p bota up -d --build bota && docker exec -it os sh entrypoint.sh /bin/bash


