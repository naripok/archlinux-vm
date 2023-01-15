#!/usr/bin/bash

source ./config.sh

# Start the VM using the last saved snapshot
sudo qemu-system-x86_64 \
  -enable-kvm \
  -m $MEMORY \
  -smp $VCPUS \
  -drive file=$DISK_IMAGE,format=qcow2,if=virtio \
  -net nic,model=virtio \
  -net user \
  -vga qxl \
  -fsdev local,id=host,path=$SHARED_DIR,security_model=mapped \
  -device virtio-9p-pci,fsdev=host,mount_tag=host \
  -loadvm $SNAPSHOT_NAME \
  -monitor unix:/tmp/qemu-monitor-$VM_NAME,server,nowait
