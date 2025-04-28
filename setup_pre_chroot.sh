#!/bin/bash

fdisk /dev/sda

mkfs.ext4 /dev/sda2
mkfs.fat -F 32 /dev/sda1

mount /dev/sda2 /mnt
mount --mkdir /dev/sda1 /mnt/boot

pacstrap -K /mnt base base-devel linux linux-firmware e2fsprogs networkmanager sof-firmware git neovim man-db man-pages texinfo archlinuxarm-keyring

genfstab -U /mnt >> /mnt/etc/fstab

echo "Now chroot into your new system via `arch-chroot /mnt` and execute `setup_pre_reboot.sh`!"
