#!/usr/bin/env bash

# check release
if [ ! -f /etc/arch-release ] ; then
    exit 0
fi

# check for updates
aur=$(paru -Qua | wc -l)
ofc=$(pacman -Qu | wc -l)

# calculate total available updates
upd=$(( ofc + aur ))
echo "$upd"

# show tooltip
if [ $upd -eq 0 ] ; then
    echo " Packages are up to date"
else
    echo "󱓽 Official $ofc 󱓾 AUR $aur"
fi

# trigger upgrade
if [ "$1" == "up" ] ; then
    kitty --title systemupdate sh -c 'yay -Syu'
fi

