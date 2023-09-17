#!/bin/sh
pushd ~/.dotfiles
printf "\nRebuilding user configurations\n\n"
home-manager switch --flake ./#aristides
printf "Rebuilding system configurations\n\n"
sudo nixos-rebuild switch --flake '.#nixhome'
popd
