#! /bin/sh

cfdisk

mkfs.ext4 /dev/sda1
mkfs.fat -F32 /dev/sda2
mkswap /dev/sda3
swapon /dev/sda3
