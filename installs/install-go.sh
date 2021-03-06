#!/usr/bin/env bash

## Install gimme
echo "[1/4] Installing gimme (github.com/travis-ci/gimme)"
sudo curl -sfL https://raw.githubusercontent.com/travis-ci/gimme/master/gimme -o /usr/bin/gimme
sudo chmod +x /usr/bin/gimme
echo "*** gimme is ready"

## Install direnv
echo "[2/4] Installing direnv (github.com/direnv/direnv)"
download_url=$(curl -sfL https://api.github.com/repos/direnv/direnv/releases/latest \
     | grep browser_download_url \
     | cut -d '"' -f 4 \
     | grep linux-amd64 )
sudo curl -sfL "$download_url" -o /usr/bin/direnv
sudo chmod +x /usr/bin/direnv
echo "*** Adding direnv hook into shell"
echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
echo "*** direnv is ready"

## Create workspace/go if it doesn't exist
echo "[3/4] Installing Go stable version"
mkdir -p "${HOME}/workspace/go"
gimme stable >> "${HOME}/.zshrc"
sed -i '/go\ version/d' "${HOME}/.zshrc"
echo "export GOPATH=${HOME}/workspace/go" >> "${HOME}/.zshrc"
echo 'export PATH=${GOPATH}/bin:${PATH}'  >> "${HOME}/.zshrc"

## Reload shell environment
echo "[4/4] Reloading shell environment"
source "${HOME}/.zshrc"

## Successful exit code
exit 0
