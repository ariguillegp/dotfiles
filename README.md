Before executing any script in this folder you need to (this is done on Arch Linux by the script by default):

sudo pacman -S --needed --noconfirm python
sudo pacman -S --needed --noconfirm lua
sudo pacman -S --needed --noconfirm vim
sudo pacman -S --needed --noconfirm curl
sudo pacman -S --needed --noconfirm tmux
sudo pacman -S --needed --noconfirm git
sudo pacman -S --needed --noconfirm bash-completion

Then run the scripts in the following order:

./install-golang
./install
