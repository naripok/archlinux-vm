# My archlinux virtual development environment

## Install

You gonna need a host archlinux machine with the `qemu-full` package installed.

- Run the VM

```bash
./qemu-run.sh
```

- Mount the shared directory in the guest machine

```bash
mkdir /tmp/host
mount -t 9p -o trans=virtio host /tmp/host -oversion=9p2000.L
```
