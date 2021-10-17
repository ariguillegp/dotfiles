#!/usr/bin/env zsh

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

## Successful exit
exit 0
