#!/usr/bin/env bash

# Some neovim plugins need the nightly version
echo "[1/4] Installing neovim nightly"
yay -S neovim-nightly-bin

# Needed for telescope lua integration
echo "[2/4] Installing telescope dependencies"
yay -S fd ripgrep

echo "[3/4] Installing neovim symlinks"
yay -S neovim-symlinks

# Link nvim config directories
echo "[4/4] Creating link from dotfiles to neovim config files"
for f in plugin lua init.lua; do
    ## Check if the file (works for directories too) exists
    ## (can be empty tho) and it is not a symlink
    if [ -e ~/."$f" ] && [ ! -L ~/."$f" ]; then
        mv ~/.config/nvim/"$f" ~/.dotfiles/original_backup/
        ln -s ~/.dotfiles/"$f" ~/.config/nvim/"$f"
    fi
done

exit 0
