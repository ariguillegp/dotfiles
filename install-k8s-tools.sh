#!/usr/bin/env bash

## Installs kubectl
function install_kubectl {
  ## Download source code
  curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"

  ## Assign execution permissions
  chmod +x ./kubectl

  ## Move binary to the PATH
  sudo mv ./kubectl /usr/local/bin/kubectl

  ## Checking client vesion installed
  kubectl version --client

  ## Enable kubectl auto-completion -- I have a plugin for oh-my-zsh already
  echo 'source <(kubectl completion bash)' >> ~/.bashrc
}

## Installs kind
function install_kind {
  ## KIND
  ## Go is a pre-requisite to install kind
  ## using this method. You can always consult
  ## the docs for the Linux alternative

  ## Install kind
  GO111MODULE="on" go get sigs.k8s.io/kind@v0.9.0

  ## Get version confirmation
  kind version

  ## Restart the host after the installation to
  ## get the correct iptables settings in place
  echo -e "Restart the computer to get iptables in shape\n"
}

function main {
  install_kubectl
  install_kind
}

## Main execution thread
main
## Successful exit
exit 0