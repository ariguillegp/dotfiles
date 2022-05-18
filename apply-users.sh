#!/bin/sh

pushd ~/.dotfiles
home-manager switch -f ./users/aristides/home.nix
popd
