#!/bin/sh
pushd ~/.dotfiles
printf "\nRebuilding user configurations\n\n"
home-manager switch --impure --flake ./#aristides --experimental-features 'nix-command flakes'
printf "Rebuilding system configurations\n\n"
sudo nixos-rebuild switch --flake '.#'
popd
