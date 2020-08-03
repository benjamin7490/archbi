#! /bin/sh

sudo git clone https://aur.archlinux.org/adduser.git
cd adduser/
makepkg -sri

sudo git clone https://aur.archlinux.org/trizen
cd trizen/
makepkg -sri

sudo localectl set-x11-keymap fr

sudo pacman -S plasma kde-applications digikam elisa kdeconnect packagekit-qt5

sudo systemctl enable sddm
sudo systemctl start sddm
