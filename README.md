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
bash host/install.sh
```

### Post-install

Now you should be have a minimal KDE arch installation fully configured and ready to run.
Cheers!

To do some work on it, run:

```bash
./run.sh
```
