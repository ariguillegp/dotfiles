#!/usr/bin/env zsh

## Install virtualbox, kernel modules and guest additions
sudo pacman -S --noconfirm --needed virtualbox virtualbox-host-modules-arch virtualbox-guest-iso

## Install extension package
yay -S virtualbox-ext-oracle

## Install vagrant
sudo pacman -S --noconfirm --needed vagrant
vagrant --version

## Successful exit
exit 0
