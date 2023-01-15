# My archlinux virtual development environment

## Install

You gonna need a host archlinux machine with the `qemu-full` package installed.

### Create the VM

```bash
./create.sh
```

### Perform the automated system install

In the guest machine, go:

```bash
mkdir host
mount -t 9p host host
bash host/archinstall.sh
```

### Done!

Shutdown the machine and run the version without the attached installation medium

```bash
./run.sh
```
