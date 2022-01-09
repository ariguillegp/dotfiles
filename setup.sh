#!/usr/bin/env bash

# Requirements
sudo pacman -S --noconfirm --needed ansible sshpass

# Backup initial files not owned by stow
find configs/* ! -path "*bin*" -type f | cut -d"/" -f3- | while read -r f; do cp "$HOME/$f" "$HOME/.dotfiles/original_backup/"; done

# Setup my machine
ansible-playbook --ask-become-pass --ask-vault-pass -i hosts install.yml

# Success
exit 0
