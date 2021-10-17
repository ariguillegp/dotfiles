#!/usr/bin/env zsh

## Install docker daemon
echo "[1/3] Installing docker"
sudo pacman -S --needed --noconfirm docker

## Add current user to "docker" group so docker can
## be run by a non-root user
echo "[2/3] Adding $USER to docker group"
sudo usermod -aG docker "$USER"

## Start docker daemon after boot
echo "[3/3] Enabling docker service"
sudo systemctl enable docker

## Successful exit
exit 0
