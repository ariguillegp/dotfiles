#!/usr/bin/env zsh

## Install packages for setting personalized environment
sudo pacman -S --needed --noconfirm alsa-utils bash-completion flameshot htop \
                                    jq lsof ncdu playerctl p7zip pulseaudio-alsa \
                                    pulseaudio-bluetooth pulseaudio-equalizer \
                                    pulseaudio-jack rsync shellcheck stow tar \
                                    tree tmux unzip unrar wget zsh

## Audio codecs and tools
sudo pacman -S --needed --noconfirm a52dec faac faad2 flac jasper lame libdca \
                                    libdv libmad libmpeg2 libtheora libvorbis \
                                    libxv sof-formware wavpack x264 xvidcore vlc

## Fix audio issues
echo "load-module module-alsa-sink device=hw:0,0 channels=4" >> /etc/pulse/default.pa
echo "load-module module-alsa-source device=hw:0,6 channels=4" >> /etc/pulse/default.pa

## If you have a system-wide PulseAudio setup make sure the user running the daemon
## (usually pulse) is in the lp group and you load the bluetooth modules in your
## PulseAudio config:
echo "load-module module-bluetooth-policy" >> /etc/pulse/system.pa
echo "load-module module-bluetooth-discover" >> /etc/pulse/system.pa

## Install helper for dealing with AUR packages
git clone https://aur.archlinux.org/yay.git
cd yay || exit 1
makepkg -si
cd .. && rm -rf yay

# create an ssh key in case we don't have it yet
if [ ! -e "$HOME/.ssh/id_rsa" ]; then
	echo -e  'y\n' | ssh-keygen -t rsa -b 4096 -C "ariguille.gp@gmail.com" -q -f ~/.ssh/id_rsa -N "" > /dev/null
fi

## Added brave browser
yay -S brave-nightly-bin

## Added slack desktop client
yay -S slack-desktop

## Added dos to unix conversion tool
yay -S dos2unix

## Added keybase
yay -S keybase-bin

for i in install-*.sh; do
  ./"$i"
done

## Successful exit
exit 0
