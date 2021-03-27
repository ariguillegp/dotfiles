#!/usr/bin/env bash

## Do not make soft links out of these file system objects
declare -a exclusion=(install.sh install-alacritty install-ansible.sh install-bpf-tools.sh \
                      install-docker.sh install-dockercompose.sh install-gcloud.sh \
                      install-golang.sh install-i3.sh install-k8s-tools.sh install-postman.sh \
                      install-terraform.sh install-vim.sh install-vm-tools.sh \
                      install-ssl-tools.sh i3 init.vim alacritty original_backup \
                      polybar postman plugin README.md rofi)

in_array() {
  local haystack=${1}[@]
  local needle=${2}
  for i in ${!haystack}; do
    if [[ ${i} == ${needle} ]]; then
      return 0
    fi
  done
  return 1
}

shopt -s nullglob

for f in ~/.dotfiles/*; do
	filename=${f##*/}
	if in_array exclusion "$filename"; then
		continue
	fi

	if [ -e ~/."$filename" ] && [ ! -L ~/."$filename" ]; then
		mkdir -p ~/.dotfiles/original_backup
		mv ~/."$filename" ~/.dotfiles/original_backup/
	fi

	ln -fsv "$f" ~/."$filename"
done

## Install packages for setting personalized environment
sudo pacman -S --needed --noconfirm alsa-utils bash-completion firefox flameshot htop \
                                    jq lsof ncdu playerctl p7zip pulseaudio-alsa \
                                    pulseaudio-bluetooth pulseaudio-equalizer \
                                    pulseaudio-jack rsync shellcheck tar tree\
                                    tmux unzip unrar wget zsh

## Audio codecs and tools
sudo pacman -S --needed --noconfirm a52dec faac faad2 flac jasper lame libdca libdv libmad \
                                    libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore vlc

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
source install-golang.sh

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

## Install alacritty terminal emulator
source install-alacritty.sh
## Install neovim
source install.nvim.sh
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
