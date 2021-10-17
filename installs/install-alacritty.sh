#!/usr/bin/env zsh

## install alacritty requirements
pacman -S --needed --noconfirm cmake freetype2 fontconfig pkg-config make libxcb

## install alacritty terminal emulator
sudo pacman -S --needed --noconfirm alacritty

## Successful exit
exit 0
