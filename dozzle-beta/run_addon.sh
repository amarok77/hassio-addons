#!/bin/bash
set -e

#eval $(jq --raw-output '.env_var | .[] | "export " + .name + "=\"" + .value + "\""' /data/options.json)

#chown -R grafana:grafana /data
docker run -d --name=dozzle -p 8080:8080 --privileged -v /var/run/docker.sock:/var/run/docker.sock amir20/dozzle:latest

#go dev /run.sh