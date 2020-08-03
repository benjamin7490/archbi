#! /bin/sh

cd /home/archbi 

sudo git clone https://aur.archlinux.org/trizen
sudo cd trizen/
sudo makepkg -sri

sudo trizen -Syy adduser

sudo localectl set-x11-keymap fr

sudo pacman -S plasma kde-applications digikam elisa kdeconnect packagekit-qt5

sudo systemctl enable sddm
sudo systemctl start sddm

userdel archbi

exit
