#!/bin/bash

cd "$(dirname "$0")"

pacman -Qeqn > ./pkglist.txt
pacman -Qeqm > ./pkglist-aur.txt

