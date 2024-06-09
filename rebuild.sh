#!/bin/sh
pushd ~/.dotfiles
printf "\nRebuilding user configurations\n\n"
home-manager switch  --experimental-features 'nix-command flakes' --impure --flake '.#'
printf "Rebuilding system configurations\n\n"
sudo nixos-rebuild switch --flake '.#'
popd
