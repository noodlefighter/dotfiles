#!/bin/bash

set -o nounset
set -o errexit
cd "$(dirname "$0")"

if cat /etc/os-release |grep 'ID=manjaro' > /dev/null ; then
  echo manjaro
  ./pkgsync pkglist.json list-sync | sudo pacman -Sy --needed -
  ./pkgsync pkglist-aur.json list-sync | yay -S --needed -
fi


if cat /etc/os-release |grep 'ID=debian' > /dev/null ; then
  echo debian
  sudo apt install $(./pkgsync pkglist.json list-sync)
fi

