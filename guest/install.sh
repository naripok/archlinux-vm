#!/usr/bin/bash

# fixup pacman parallel downloads
sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 30/' /etc/pacman.conf

archinstall --config host/archinstall/config.json --disk_layouts host/archinstall/disk.json --creds host/archinstall/creds.json --silent && shutdown now
