#!/usr/bin/env bash

## install alacritty requirements
pacman -S --needed --noconfirm cmake freetype2 fontconfig pkg-config make libxcb

## install alacritty terminal emulator
sudo pacman -S --needed --noconfirm alacritty

## Copy alacritty config files
ln -s ~/.dotfiles/alacritty ~/.config/alacritty

## Successful exit
exit 0
