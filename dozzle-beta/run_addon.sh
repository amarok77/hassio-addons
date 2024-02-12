#!/bin/bash
set -e

#eval $(jq --raw-output '.env_var | .[] | "export " + .name + "=\"" + .value + "\""' /data/options.json)

#chown -R grafana:grafana /data

go dev /run.sh