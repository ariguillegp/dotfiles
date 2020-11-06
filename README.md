
# Dotfiles

## Getting Started

If you want to test the environment just follow these instructions:
* Install all the dependencies.
* Go to your home directory.
* Clone the repository.
* Change the name of the dotfiles directory to .dotfiles.
* Go into the directory.
* Take a look into the install scripts to change any user related information.
* Run the install scripts.

## Prerequisites

Before executing any script in this folder you need to (default setting is for Arch Linux):

> **NOTE:** When installing i3, do not select i3-wm since it has conflicts with i3-gaps, just select every option but i3-wm

```
sudo pacman -S --needed --noconfirm python lua vim curl git
```

## Installing

How to get a development env up and running

```
cd
git clone https://github.com/ariguillegp/dotfiles.git
mv dotfiles .dotfiles && cd .dotfiles
** Change needed script parameters **
./install-base
./install-vim
./install-golang
./install-bpf-tools
./install-terraform
./install-docker
./install-kubectl
./install-kind
./install-root
```
## Authors

* **Aristides Gonzalez** - *Initial work* - [Cello1500](https://github.com/cello1500)
