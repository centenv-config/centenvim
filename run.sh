#!/bin/bash

container_runtime=podman
container_name=neovim-dev

$container_runtime build -t neovim-dev:latest .

if [ -z "$1" ]; then
  echo "no arg provided"
  exit 1
fi

$container_runtime run -v ./$1:/root/.config/nvim -it --rm $container_name bash
