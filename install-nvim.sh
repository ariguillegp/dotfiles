#!/usr/bin/env bash

# Some neovim plugins need the nightly version
echo "[1/5] Installing neovim nightly"
yay -S neovim-nightly-bin

# Needed for telescope lua integration
echo "[2/5] Installing telescope dependencies"
yay -S fd ripgrep

echo "[3/5] Installing neovim symlinks"
yay -S neovim-symlinks

# Link from init file from dotfiles
echo "[4/5] Creating link from dotfiles to neovim init file"
mkdir -p ~/.config/nvim/undodir
ln -s ~/.dotfiles/init.vim ~/.config/nvim/init.vim

# Link from plugins directory from dotfiles
echo "[5/5] Creating link from dotfiles to neovim plugins directory"
ln -s ~/.dotfiles/plugin ~/.config/nvim/plugin

exit 0
