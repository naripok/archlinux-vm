#!/bin/bash

source ./config.sh

# Create the virtual machine but do not start it
# Adds a virtiofs 9p share to the VM
sudo virt-install \
  --name $VM_NAME \
  --osinfo $OS_NAME \
  --memory $MEMORY \
  --vcpus $VCPUS \
  --disk path=$DISK_IMAGE,size=$DISK_SIZE \
  --cdrom $ISO_IMAGE \
  --network network=default \
  --graphics spice \
  --filesystem type=9p,source=$SHARED_DIR,target=$SHARED_DIR \
  --noautoconsole

# Dump the xml file to a file
sudo virsh dumpxml $VM_NAME > $VM_NAME.xml

# Connect to the virtual machine 
sudo virt-viewer $VM_NAME
