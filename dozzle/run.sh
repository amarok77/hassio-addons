#!/bin/sh
set -e

docker run --name dozzle -d --volume=/var/run/docker.sock:/var/run/docker.sock:ro -p 8888:8080 amir20/dozzle:latest
