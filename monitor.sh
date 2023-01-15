#!/usr/bin/bash

source ./config.sh

# Connect to the qemu monitor
sudo socat - UNIX-CONNECT:/tmp/qemu-monitor-arch
