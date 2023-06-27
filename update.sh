#!/bin/sh

# Update deps
printf "\n--- Updating flakes ---\n"
nix flake update
