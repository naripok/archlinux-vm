#!/usr/bin/bash

source ./config.sh

# Create a snapshot of the virtual machine atomically
echo "loadvm $SNAPSHOT_NAME" | sudo socat - UNIX-CONNECT:/tmp/qemu-monitor-arch
