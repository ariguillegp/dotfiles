#!/usr/bin/env bash

## install alacritty requirements
pacman -S --needed --noconfirm cmake freetype2 fontconfig pkg-config make libxcb

## install alacritty terminal emulator
sudo pacman -S --needed --noconfirm alacritty

## Copy alacritty config files
mkdir -p ~/.config/alacritty
ln -s ~/.dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

## Successful exit
exit 0
