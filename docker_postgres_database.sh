#!/usr/bin/env bash

# This script runs commands inside a container, if you don't or can't install postgres 
# put it to run inside a container and then use this script to communicate with it.
#
# It is recommended to name the script to 'psql', so you can run
#
# $ psql -U postgres
# 
# and it is going to be translated to
# 
# $ docker exec -it postgres_container psql -U postgres
#
# This way, it would work like postgres is installed in your machine.

readonly container_name="postgres_container"

docker exec -it $container_name psql $@
