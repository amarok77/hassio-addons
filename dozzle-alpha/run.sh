#!/bin/bash

docker run -d --name=dozzle -p 8080:8080 --privileged -v /var/run/docker.sock:/var/run/docker.sock amir20/dozzle:latest
