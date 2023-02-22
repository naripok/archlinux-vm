#!/usr/bin/bash

# Give us the power to sudo without a password
echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd -
rm -rf yay

# Install our dotfiles
git clone https://github.com/naripok/.dotfiles.git
cd .dotfiles
bash tools/link.sh
cd -

# Install our packages
yay -S --noconfirm --needed - < ~/host/guest/packages.txt
