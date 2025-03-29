#!/bin/sh

printf "\n=====================================================================\n"
printf "Updating dependencies\n"
printf "=====================================================================\n"
# Updates all dependencies
nix flake update --experimental-features 'nix-command flakes'
# Rebuilds active configuration
./rebuild.sh
