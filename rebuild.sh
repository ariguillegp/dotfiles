#!/bin/sh

# Rebuild conifg
printf "\n--- Rebuilding dotfiles ---\n"
nix run . switch -- --flake .
