#!/usr/bin/env bash

# install i3 wm and some other related tools
sudo pacman -S i3 arandr xorg picom \
               lxappearance pcmanfm feh imagemagick \
               thunar pacman-contrib rofi scrot

## install fonts and themes
sudo pacman -S ttf-dejavu ttf-liberation noto-fonts lightdm \
               lightdm-gtk-greeter lightdm-gtk-greeter-settings \
               materia-gtk-theme papirus-icon-theme

## fancier lock screen
yay -S i3lock-color

# backing up config files and linking dotfiles
mv ~/.config/i3 ~/.dotfiles/original_backup/i3
ln -s ~/.dotfiles/config/i3 ~/.config/i3

## Successful exit
exit 0
