#!/usr/bin/env zsh

# Some neovim plugins need the nightly version
echo "[1/5] Installing neovim nightly"
yay -S neovim-nightly-bin

# Needed for telescope lua integration
echo "[2/5] Installing telescope dependencies"
yay -S fd ripgrep

echo "[3/5] Installing neovim symlinks"
yay -S neovim-symlinks

echo "[4/5] Installing dependencies for python provider"
sudo pacman -S python-pip
python3 -m pip install --user --upgrade pynvim

echo "[5/5] more useful tools -- fuzzy finder"
sudo pacman -S fzf

exit 0
