#!/usr/bin/env bash

## Version to be used
VER="1.0.9"

## Get terraform bundle
wget https://releases.hashicorp.com/terraform/"$VER"/terraform_"$VER"_linux_amd64.zip
unzip terraform_"$VER"_linux_amd64.zip
rm terraform_"$VER"_linux_amd64.zip

## Copy binary to PATH
sudo mv terraform /usr/local/bin/

## Enable terraform auto-completion
terraform -install-autocomplete

## Validate installation
terraform version

## Successful exit
exit 0
