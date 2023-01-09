#!/bin/bash

# Setup an arch linux installation from scratch

# Set the keyboard layout
loadkeys us

# Update the system clock
timedatectl set-ntp true

# Partition the disks
# TODO: Make this more flexible
fdisk /dev/vda <<EOF
g
n
1


w
EOF

# Format the partitions
mkfs.ext4 /dev/vda1

# Mount the file systems
mount /dev/vda1 /mnt

# Install essential packages
pacstrap /mnt base base-devel

# Generate an fstab
genfstab -U /mnt >> /mnt/etc/fstab

# Chroot into the new system
arch-chroot /mnt

# Set the time zone
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime

# Generate /etc/adjtime
hwclock --systohc

# Set the locale
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen

# Generate the locale
locale-gen

# Set the LANG variable
echo 'LANG=en_US.UTF-8' > /etc/locale.conf

# Set the hostname
echo 'ag-tau' > /etc/hostname

# Install the bootloader
pacman -S grub
grub-install /dev/vda
grub-mkconfig -o /boot/grub/grub.cfg

# Set the root password
passwd

# Exit the chroot environment
exit

# Reboot
reboot
