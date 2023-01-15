#!/bin/bash

source ./config.sh

sudo virsh destroy $VM_NAME
