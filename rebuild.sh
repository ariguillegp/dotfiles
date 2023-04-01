#!/bin/sh

# Update deps
nix flake update

# Rebuild conifg
sudo nixos-rebuild switch --flake .#nixdso
