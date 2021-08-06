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

list pending packages:

```
$ ./pkgsync pkglist.json list-pending
```

install from list:
```
$ ./pkgsync pkglist.json list-sync | sudo pacman -S -
```

