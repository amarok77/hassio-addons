#!/bin/bash



# Effettua il bind mount della directory
docker run --detach --volume=/var/run/docker.sock:/var/run/docker.sock -p 8080:8080 amir20/dozzle
