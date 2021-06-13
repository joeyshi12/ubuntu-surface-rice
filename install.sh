#!/bin/bash

# update
sudo apt update
sudo apt upgrade


# copy configs + wallpapers + fonts + themes
cp -r .config/* ~/.config
cp .Xresources ~
cp .xinitrc ~
cp .bash* ~
cp -r .vim* ~
cp -r wallpapers ~/Pictures
sudo cp -r .fonts /usr/share/fonts/truetype
fc-cache -v
cp -r .themes/* /usr/share/themes/
sudo cp jre.sh /etc/profile.d


# dependencies from blue-sky rice
sudo apt install build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev
sudo apt install cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev
sudo apt install meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev  libpcre2-dev  libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev


# polybar + picom installation
cd ~/Downloads
git clone --recursive https://github.com/polybar/polybar
cd polybar
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install

cd ~/Downloads
git clone https://github.com/ibhagwan/picom.git
cd picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install


# install applications
sudo apt install bspwm rofi ranger cmatrix feh pulseaudio xbacklight tlp zathura latexmk texlive texlive-pictures python3-pip
pip3 install ueberzug
sudo snap install alacritty --classic
sudo snap install code --classic
sudo add-apt-repository ppa:hsheth2/ppa
sudo apt update
sudo apt install cava


# install brave-browser
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser


# linux-surface
cd ~/Downloads
wget -qO - https://raw.githubusercontent.com/linux-surface/linux-surface/master/pkg/keys/surface.asc \
    | gpg --dearmor | sudo dd of=/etc/apt/trusted.gpg.d/linux-surface.gpg
echo "deb [arch=amd64] https://pkg.surfacelinux.com/debian release main" \
	| sudo tee /etc/apt/sources.list.d/linux-surface.list
sudo apt update
sudo apt install linux-image-surface linux-headers-surface iptsd libwacom-surface
sudo systemctl enable iptsd
sudo apt install linux-surface-secureboot-mok


sudo reboot
