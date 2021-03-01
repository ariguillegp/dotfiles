#!/usr/bin/env bash

# Some neovim plugins need the nightly version
echo "[1/7] Installing neovim nightly"
yay -S neovim-nightly-bin

# Needed for telescope lua integration
echo "[2/7] Installing telescope dependencies"
yay -S fd ripgrep

echo "[3/7] Installing neovim symlinks"
yay -S neovim-symlinks

# Link from init file from dotfiles
echo "[4/7] Creating link from dotfiles to neovim init file"
mkdir -p ~/.config/nvim/undodir
ln -s ~/.dotfiles/init.vim ~/.config/nvim/init.vim

# Link from plugins directory from dotfiles
echo "[5/7] Creating link from dotfiles to neovim plugins directory"
ln -s ~/.dotfiles/plugin ~/.config/nvim/plugin

echo "[6/7] Get binary for Go autocompletion"
go get -u github.com/stamblerre/gocode

echo "[7/7] Adding YAML linter tool"
sudo pacman -S --needed --noconfirm yamllint

# Copy yamllint config files
if [ -f "$HOME/.config/yamllint" ]; then
  mv ~/.config/yamllint ~/.dotfiles/original_backup/yamllint
fi

ln -s ~/.dotfiles/yamllint ~/.config/yamllint
exit 0
