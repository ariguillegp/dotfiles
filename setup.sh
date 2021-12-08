#!/bin/bash

# Requirements
sudo pacman -S --noconfirm --needed ansible sshpass vim-ansible

# Setup my machine
ansible-playbook --ask-become-pass -i hosts dotfiles.yml

# Success
exit 0
