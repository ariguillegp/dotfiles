#!/usr/bin/env bash

## Create backup directory to keep original files in case something
## goes wrong
mkdir -p ~/.dotfiles/original_backup
## Backup original files and create symlinks for new ones
for f in gitconfig tmux.conf zshrc p10k.zsh; do
    ## Check if the file exists (can be empty tho)
    ## and it is not a symlink
    if [ -e ~/."$f" ] && [ ! -L ~/."$f" ]; then
        mv ~/."$f" ~/.dotfiles/original_backup/
        ln -s ~/.dotfiles/"$f" ~/."$f"
    fi
done

## Install packages for setting personalized environment
sudo pacman -S --needed --noconfirm alsa-utils bash-completion flameshot htop \
                                    jq lsof ncdu playerctl p7zip pulseaudio-alsa \
                                    pulseaudio-bluetooth pulseaudio-equalizer \
                                    pulseaudio-jack rsync shellcheck tar tree \
                                    tmux unzip unrar wget zsh

## Audio codecs and tools
sudo pacman -S --needed --noconfirm a52dec faac faad2 flac jasper lame libdca \
                                    libdv libmad libmpeg2 libtheora libvorbis \
                                    libxv wavpack x264 xvidcore vlc

## Fix audio issues
sudo pacman -S --needed --noconfirm sof-firmware
echo "load-module module-alsa-sink device=hw:0,0 channels=4" >> /etc/pulse/default.pa
echo "load-module module-alsa-source device=hw:0,6 channels=4" >> /etc/pulse/default.pa

## If you have a system-wide PulseAudio setup make sure the user running the daemon
## (usually pulse) is in the lp group and you load the bluetooth modules in your
## PulseAudio config:
echo "load-module module-bluetooth-policy" >> /etc/pulse/system.pa
echo "load-module module-bluetooth-discover" >> /etc/pulse/system.pa

## Install Go
source install-go.sh

## Install helper for dealing with AUR packages
git clone https://aur.archlinux.org/yay.git
cd yay || exit 1
makepkg -si
cd .. && rm -rf yay

## Added slack desktop client
yay -S slack-desktop

## Added dos to unix conversion tool
yay -S dos2unix

## Added keybase
yay -S keybase-bin

## Added brave browser
yay -S brave-nightly-bin

# create an ssh key in case we don't have it yet
if [ ! -e "$HOME/.ssh/id_rsa" ]; then
	echo -e  'y\n' | ssh-keygen -t rsa -b 4096 -C "ariguille.gp@gmail.com" -q -f ~/.ssh/id_rsa -N "" > /dev/null
fi

## Move tmux project selector to OS path
sudo ln -s "$HOME/.dotfiles/bmux.sh" /usr/local/bin/bmux

## Install alacritty terminal emulator
source install-alacritty.sh

## Install neovim
source install-nvim.sh

## Install docker and tools
source install-docker.sh
source install-dockercompose.sh

## Install bpf libraries
source install-bpf-tools.sh

## Install i3 windows manager
source install-i3.sh

## Install gcloud client
source install-gcloud.sh

## Install k8s tools
source install-k8s-tools.sh

## Install postman
source install-postman.sh

## Install ssl tools
source install-ssl-tools.sh

## Install terraform tools
source install-terraform.sh

## Install VM tools
source install-vm-tools.sh

## Install Ansible
source install-ansible.sh

## Successful exit
exit 0
