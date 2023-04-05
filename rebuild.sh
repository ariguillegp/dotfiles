#!/bin/sh

# Update deps
printf "\n--- Updating flakes ---\n"
nix flake update

# Rebuild conifg
printf "\n--- Rebuilding local configurations ---\n"
sudo nixos-rebuild switch --flake .#nixdso
