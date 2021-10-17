#!/usr/bin/env zsh

## sshpass is a requirement to authenticate with regular passwords
## vim-ansible improves vim support
sudo pacman -S --noconfirm --needed ansible sshpass vim-ansible

## Validate installation
ansible --version

## Successful exit
exit 0
