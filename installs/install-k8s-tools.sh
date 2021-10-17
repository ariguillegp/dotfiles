#!/usr/bin/env zsh

## Installs kubectl
function kubectl {
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
function kind {
  ## KIND
  ## Go is a pre-requisite to install kind
  ## using this method. You can always consult
  ## the docs for the Linux alternative

  ## Install kind
  GO111MODULE="on" go get sigs.k8s.io/kind

  ## Get version confirmation
  kind version

  ## Restart the host after the installation to
  ## get the correct iptables settings in place
  echo -e "Restart the computer to get iptables in shape\n"
}

## Installs OPA client
function opa {
    ## Get latest version of opa and put it in the PATH
    sudo curl -L https://openpolicyagent.org/downloads/latest/opa_linux_amd64 \
        -o /usr/local/bin/opa
}

function operator-sdk {
   ## Get latest code from master branch
   git clone https://github.com/operator-framework/operator-sdk /tmp/operator-sdk
   cd /tmp/operator-sdk || exit 1
   git checkout master
   ## Install from makefile
   make install
}

function main {
  kubectl
  kind
  opa
  operator-sdk
}

## Main execution thread
main
## Successful exit
exit 0
