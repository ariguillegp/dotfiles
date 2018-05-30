
# Dotfiles

These files make a nice and useful environment for developing Go applications on a Linux-based machine.  
Some configurations such as the command prompt and the Golang development environment are noteworthy.  


## Getting Started  

If you want to test the environment just follow these instructions:  
* Install all the dependencies.  
* Go to your home directory.  
* Clone the repository.  
* Change the name of the dotfiles directory to .dotfiles.  
* Go into the directory.
* On the install script change to email to yours.
* On the install-root script change the home directory to yours.
* Run the install scripts.  

## Prerequisites  

Before executing any script in this folder you need to (default setting is for Fedora):  

```
sudo dnf install -y python lua vim curl tmux git bash-completion

```
## Installing

How to get a development env up and running

```
cd
git clone https://github.com/ariguillegp/dotfiles.git
mv dotfiles .dotfiles && cd .dotfiles
** Change the needed script parameters **
./install-golang 1.10.2
./install
./install-root
```
## Authors

* **Aristides Gonzalez** - *Initial work* - [Cello1500](https://github.com/cello1500)
