#!/bin/sh
pushd ~/.dotfiles
home-manager switch --flake ./#aristides
popd
