#!/bin/sh

printf "\nUpdating dependencies\n\n"
# Updates all dependencies
nix flake update
# Rebuilds active configuration
./rebuild.sh
