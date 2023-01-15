#!/bin/bash

source ./config.sh

read -p "Are you sure you want to delete $VM_NAME? [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  # stop the virtual machine
  sudo virsh destroy $VM_NAME
  # delete the virtual machine
  sudo virsh undefine $VM_NAME
  # delete the disk image
  sudo rm $DISK_IMAGE
  # delete the xml file
  sudo rm $VM_NAME.xml

  echo "Deleted $VM_NAME"
fi
