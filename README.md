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
./host/guest/install.sh
```

### Post-install

Now you should be have a minimal KDE arch installation fully configured and ready to run.
Cheers!

Now let's configure our dev environment.
In the host machine, run:

```bash
./post-install.sh
```

This will boot the freshly installed KDE environment.
The default password is `password`. You should change this at some point.

To run the environment configuration, go:

```bash
mkdir host
sudo mount -t 9p host host
./host/guest/post-install.sh
```
