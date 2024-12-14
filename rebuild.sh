#!/bin/sh
pushd ~/.dotfiles
printf "\n#################### Rebuilding user configuration  ##################\n\n"
home-manager switch --impure --flake '.#nixhome'
printf "\n#################### Rebuilding system configuration  ##################\n\n"
sudo nixos-rebuild switch --flake '.#nixhome'
popd
