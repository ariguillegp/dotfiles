#!/usr/bin/env bash

## Version to be used
VER=1.5.0

## Get cfssl tools
curl -L https://github.com/cloudflare/cfssl/releases/download/v"$VER"/cfssl_"$VER"_linux_amd64 -o cfssl
curl -L https://github.com/cloudflare/cfssl/releases/download/v"$VER"/cfssljson_"$VER"_linux_amd64 -o cfssljson
curl -L https://github.com/cloudflare/cfssl/releases/download/v"$VER"/cfssl-certinfo_"$VER"_linux_amd64 -o cfssl-certinfo

## Set exec bit
chmod +x cfssl cfssljson cfssl-certinfo

## Add tools to the PATH
sudo mv cfssl cfssljson cfssl-certinfo /usr/local/bin

## Verifications
cfssl version
cfssljson --version

## Successful exit
exit 0
