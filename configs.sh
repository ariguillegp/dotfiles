#!/usr/bin/env bash

# TODO: Write something to take care
# of the initial files not owned by stow
find * -maxdepth 0 -name '*.conf' -exec  stow {} \;

exit 0
