#! /bin/sh

pacman -Syy zip unzip p7zip vim mc alsa-utils syslog-ng mtools dosfstools lsb-release ntfs-3g exfat-utils bash-completion nano

genfstab -U -p /mnt >> /mnt/etc/fstab

pacman -S efibootmgr grub os-prober

nano /etc/vconsole.conf
nano /etc/locale.conf
nano /etc/locale.gen

locale-gen

ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc --utc

mkinitcpio -p linux

mount | grep efivars &> /dev/null || mount -t efivarfs efivarfs /sys/firmware/efi/efivars
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch_grub --recheck

mkdir /boot/efi/EFI/boot
cp /boot/efi/EFI/arch_grub/grubx64.efi /boot/efi/EFI/boot/bootx64.efi

grub-mkconfig -o /boot/grub/grub.cfg

passwd root

pacman -Syy networkmanager
systemctl enable NetworkManager

nano /etc/pacman.conf

pacman -S ntp cronie

alsamixer
alsactl store

pacman -S gst-plugins-{base,good,bad,ugly} gst-libav
pacman -S xorg-{server,xinit} xf86-input-libinputxdg-user-dirs

pacman -S ttf-{bitstream-vera,liberation,freefont,dejavu} freetype2
pacman -S open-vm-tools xf86-video-{vesa,vmware}

systemctl enable vmtoolsd

useradd -m -g wheel -s /bin/bash archbi
passwd archbi
nano /etc/sudoers

exit
umount -R /mnt
reboot
