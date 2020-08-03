#! /bin/sh

cfdisk

nano /etc/pacman.d/mirrorlist

pacstrap /mnt base base-devel pacman-contrib linux linux-headers linux-firmaware nano git wget
