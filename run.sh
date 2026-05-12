#!/bin/bash

container_runtime=$1
container_name=centenvim-dev

$container_runtime build -t $container_name:latest .

if [ -z "$1" ]; then
  echo "no arg provided"
  exit 1
fi

$container_runtime run -v $(pwd):/root/.config/nvim -it --rm $container_name bash
