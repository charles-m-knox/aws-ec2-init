# aws-ec2-init

Installs Docker and a few other basic dependencies needed in order to run an AWS EC2 instance my way.

## Usage

```bash
sudo source installer.sh
```

## Mounting a disk

```bash
lsblk # identify the disk by its name on the left
sudo mkdir -p /mnt/ds01 # choose a mount point
sudo file -s /dev/nvme1n1 # if it just says "/dev/nvme1n1: data" it's empty
sudo mkfs -t ext4 /dev/nvme1n1 # make the filesystem here
sudo mount /dev/nvme1n1 /mnt/ds01 # temporarily mount it here
```

In order to make it a permanent mount, edit `/etc/fstab`:

```bash
# dev           mnt point       fs type options
/dev/nvme1n1    /mnt/ds01       ext4    defaults,nofail 0       0
```

> For the latter two numbers, be sure to check the [Arch Linux fstab article](https://wiki.archlinux.org/index.php/Fstab).

The device will be mounted with UID and GID `0:0`, so you should expect to make directories with permissions appropriate to the access your app needs, such as `1000:1000`.
