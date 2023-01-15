#!/usr/bin/bash

source ./config.sh

# Create a snapshot of the virtual machine
echo "savevm $SNAPSHOT_NAME" | sudo socat - UNIX-CONNECT:/tmp/qemu-monitor-arch
