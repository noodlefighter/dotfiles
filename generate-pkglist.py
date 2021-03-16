#!/bin/env python3

import os

os.system("pacman -Qeqn > pkglist.tmp.txt")
os.system("pacman -Qeqm > pkglist-aur.tmp.txt")

with open("pkglist-ignore.txt") as f_ignore:
    l_ignore = f_ignore.readlines()

    with open("pkglist.tmp.txt") as f:
        l = f.readlines()
        l = filter(lambda x: x not in l_ignore, l)
        with open("pkglist.txt", mode="w+") as f:
            f.writelines(l)

    with open("pkglist-aur.tmp.txt") as f:
        l = f.readlines()
        l = filter(lambda x: x not in l_ignore, l)
        with open("pkglist-aur.txt", mode="w+") as f:
            f.writelines(l)

os.system("rm pkglist.tmp.txt pkglist-aur.tmp.txt")
