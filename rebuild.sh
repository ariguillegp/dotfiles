#!/bin/sh
pushd ~/.dotfiles
printf "\n######################################################################\n"
printf "#################### Rebuilding user configuration  ##################\n"
printf "######################################################################\n\n"

home-manager switch --impure --flake '.#nixhome'
printf "\n########################################################################\n"
printf "#################### Rebuilding system configuration  ##################\n"
printf "########################################################################\n\n"
sudo nixos-rebuild switch --flake '.#nixhome'
popd
