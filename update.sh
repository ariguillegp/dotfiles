#!/bin/sh

printf "\n#################### Updating dependencies ##################\n\n"
# Updates all dependencies
nix flake update --experimental-features 'nix-command flakes'
# Rebuilds active configuration
./rebuild.sh
