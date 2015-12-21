#!/usr/bin/env  bash


function error {
  printf "\e[31m$*\e[0m\n" >&2
}
function info {
  printf "\e[32m$*\e[0m\n"
}


docker-compose build

if [ "x${DOCKER_MACHINE_NAME}" == "x" ]
then
        docker-compose run build
else
        docker-compose run build-on-docker-machine-fusion
fi

if [ $? -eq 0 ];
then

info "################################## build complete"
info "##"
info "## Build output can be found in ./out"
info "##"
find ./out -type f | while read f; do info "## \e[1m$f\e[21m"; done
info "##"
else
error "################################## build ERROR"
error "##"
error "## ERROR: Please check the build output for errors"
error "##"
fi
