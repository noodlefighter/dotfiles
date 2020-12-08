# dotfiles

My Linux desktop environment config.

- distribution: manjaro-cinnamon
- windows mannager: i3wm-gaps

## Usage

deploy:
```
$ sudo pacman -S stow
$ cd ~
$ git clone THIS_REPO && cd dotfiles
$ ./stow_all.sh
```

update git sub-tree:
```
$ ./subtree.sh pull i3
```

## pkglist

generate:
```
$ ./generate_pkglist.sh
```

install:
```
$ ./install_pkglist.sh pkglist.txt
```
