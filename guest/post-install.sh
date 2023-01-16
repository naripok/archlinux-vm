#!/usr/bin/bash

# Give us the power to sudo without a password
echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install our stuff
git clone https://github.com/naripok/.dotfiles.git
cd .dotfiles
git checkout arch
./tools/link.sh
