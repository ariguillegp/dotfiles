#!/usr/bin/env bash

# Some neovim plugins need the nightly version
echo "[1/4] Installing neovim nightly"
yay -S neovim-nightly-bin

# Needed for telescope lua integration
echo "[2/4] Installing telescope dependencies"
yay -S fd ripgrep

echo "[3/4] Installing neovim symlinks"
yay -S neovim-symlinks

# Link from init file from dotfiles
echo "[4/4] Creating link from dotfiles to neovim init file"
mkdir -p ~/.config/nvim/{plugin,lua,undodir}

cd ~/.dotfiles || exit 1
find . -regex ".*\.vim$\|.*\.lua$" | while read -r f; do
    rm -rf ~/.config/nvim/"$f"
    ln -s ~/.dotfiles/"$f" ~/.config/nvim/"$f"
done

exit 0
