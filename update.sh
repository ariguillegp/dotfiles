#!/bin/sh

# Updates all dependencies
nix flake update
# Rebuilds active configuration
./rebuild.sh
