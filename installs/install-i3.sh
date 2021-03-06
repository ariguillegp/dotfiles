#!/usr/bin/env bash

## install i3 wm and some other related tools
sudo pacman -S i3 i3-gaps arandr xorg picom \
               lxappearance pcmanfm feh imagemagick \
               picom thunar pacman-contrib rofi scrot

## install fonts and themes
sudo pacman -S ttf-dejavu ttf-liberation noto-fonts lightdm \
               lightdm-gtk-greeter lightdm-gtk-greeter-settings \
               materia-gtk-theme papirus-icon-theme

## fancier lock screen
yay -S i3lock-color

## fancier status bar
yay -S polybar

## Copy font-awesome ttfs for icons
mv ~/.fonts ~/.dotfiles/original_backup/.fonts
ln -s ~/.dotfiles/fonts ~/.fonts

## Copy i3 config files
mv ~/.config/i3 ~/.dotfiles/original_backup/i3
ln -s ~/.dotfiles/config/i3 ~/.config/i3

## Copy polybar config files
mv ~/.config/polybar ~/.dotfiles/original_backup/polybar
ln -s ~/.dotfiles/config/polybar ~/.config/polybar

## Copy rofi config files
mv ~/.config/rofi ~/.dotfiles/original_backup/rofi
ln -s ~/.dotfiles/config/rofi ~/.config/rofi

## Successful exit
exit 0
