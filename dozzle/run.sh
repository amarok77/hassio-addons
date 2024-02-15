#!/bin/bash

# Leggi il parametro passato
directory_to_mount=$1

# Controlla se è stato passato un parametro
if [ -z "$directory_to_mount" ]; then
  echo "Usage: $0 <directory_to_mount>"
  exit 1
fi

# Effettua il bind mount della directory
docker run --detach -v "/var/run/docker.sock:/var/run/docker.sock" amir20/dozzle:latest 
