#!/bin/sh
pushd ~/.dotfiles
printf "=====================================================================\n"
printf "Rebuilding user configuration\n"
printf "=====================================================================\n"
home-manager switch --impure --flake '.#nixhome'

printf "=====================================================================\n"
printf "Rebuilding system configuration\n"
printf "=====================================================================\n"
sudo nixos-rebuild switch --flake '.#nixhome'
popd
