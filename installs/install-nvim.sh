#!/usr/bin/env bash

# Some neovim plugins need the nightly version
echo "[1/6] Installing neovim nightly"
yay -S neovim-nightly-bin

# Needed for telescope lua integration
echo "[2/6] Installing telescope dependencies"
yay -S fd ripgrep

echo "[3/6] Installing neovim symlinks"
yay -S neovim-symlinks

echo "[4/6] Installing dependencies for python provider"
sudo pacman -S python-pip
python3 -m pip install --user --upgrade pynvim

echo "[5/6] more useful tools -- fuzzy finder"
sudo pacman -S fzf

# Link nvim config directories
echo "[6/5] Creating link from dotfiles to neovim config files"
for f in plugin lua init.lua; do
  mv ~/.config/nvim/"$f" ~/.dotfiles/original_backup/
  ln -s ~/.dotfiles/"$f" ~/.config/nvim/"$f"
done

exit 0
