#!/usr/bin/env bash

## Version to be used
VER=1.28.2

## Download binary
curl -L "https://github.com/docker/compose/releases/download/$VER/docker-compose-$(uname -s)-$(uname -m)" -o docker-compose

## Allow execution
chmod +x docker-compose

## Move to binary to PATH
sudo mv docker-compose /usr/local/bin/

## Successful exit
exit 0
