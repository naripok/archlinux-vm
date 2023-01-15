!/usr/bin/bash

# Setup an arch linux installation from scratch

# Set the keyboard layout
loadkeys us

# Update the system clock
timedatectl set-ntp true

# Partition the disks
# TODO: Make this more flexible
fdisk /dev/sda <<EOF
g
n
1


w
EOF

# Format the partitions
mkfs.ext4 /dev/sda1

# Mount the file systems
mount /dev/sda1 /mnt

# fixup pacman parallel downloads
sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 20/' /etc/pacman.conf

# Install essential packages
pacstrap /mnt\
  base base-devel linux systemd-boot\
  neovim fd ripgrep plasma-meta chromium firefox alacritty zsh git

# Generate an fstab
genfstab -U /mnt >> /mnt/etc/fstab

# Chroot into the new system
arch-chroot /mnt

# Set the time zone
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

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

# Install the bootloader using systemd-boot
bootctl --path=/mnt install

# Generate the systemd-boot config file
echo "default arch" > /mnt/boot/loader/loader.conf
echo "timeout 3" >> /mnt/boot/loader/loader.conf
echo "editor 0" >> /mnt/boot/loader/loader.conf

# Generate the systemd-boot entry for the installed system
echo "title Arch Linux" > /mnt/boot/loader/entries/arch.conf
echo "linux /vmlinuz-linux" >> /mnt/boot/loader/entries/arch.conf
echo "initrd /initramfs-linux.img" >> /mnt/boot/loader/entries/arch.conf
echo "options root=PARTUUID=$(blkid -s PARTUUID -o value /dev/sda1) rw" >> /mnt/boot/loader/entries/arch.conf

# Enable the NetworkManager service
systemctl enable NetworkManager

# Enable the SDDM service
systemctl enable sddm

# Set the root password
passwd

# Exit the chroot
exit
