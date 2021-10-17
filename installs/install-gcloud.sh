#!/usr/bin/env zsh

## Version to be used
VER=326.0.0

## Download project files
cd "$HOME"/workspace || exit 1
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-"$VER"-linux-x86_64.tar.gz
tar xvzf google-cloud-sdk-"$VER"-linux-x86_64.tar.gz
rm google-cloud-sdk-"$VER"-linux-x86_64.tar.gz

## Run installaton script
./google-cloud-sdk/install.sh

## Update components
source "$HOME"/.zshrc
gcloud components update

## Successful exit
exit 0
