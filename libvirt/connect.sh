#!/bin/bash

source ./config.sh

# Connect to the virtual machine using spice and virsh
sudo virt-viewer $VM_NAME
