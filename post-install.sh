#!/usr/bin/bash

source ./config.sh

sudo qemu-system-x86_64 \
  -enable-kvm \
  -m $MEMORY \
  -smp $VCPUS \
  -drive file=$DISK_IMAGE,format=qcow2,if=virtio \
  -net nic,model=virtio \
  -net user \
  -vga qxl \
  -nodefaults \
  -fsdev local,id=host,path=$SHARED_DIR,security_model=mapped \
  -device virtio-9p-pci,fsdev=host,mount_tag=host \
  -monitor unix:/tmp/qemu-monitor-$VM_NAME,server,nowait
