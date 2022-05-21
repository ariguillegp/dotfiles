#!/bin/sh
sudo nixos-rebuild --install-bootloader switch -I nixos-config=./system/configuration.nix
