#!/usr/bin/env  bash

docker-compose build

if [ "x${DOCKER_MACHINE_NAME}" == "x" ]
then
        docker-compose run build
else
        docker-compose run build-on-docker-machine
fi
