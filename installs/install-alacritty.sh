#!/usr/bin/env bash

## install alacritty requirements
pacman -S --needed --noconfirm cmake freetype2 fontconfig pkg-config make libxcb

## install alacritty terminal emulator
sudo pacman -S --needed --noconfirm alacritty

## backing up current config and linking dotfiles
mv ~/.config/alacritty ~/.dotfiles/original_backup/alacritty
ln -s ~/.dotfiles/config/alacritty ~/.config/alacritty

## Successful exit
exit 0
