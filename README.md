# dotfiles

My Linux desktop environment config.

- distribution: manjaro
- windows mannager: i3wm-gaps

## Usage

deploy:
```
$ sudo pacman -S stow
$ cd ~
$ git clone THIS_REPO && cd dotfiles
$ git submodule update --init --recursive
$ ./stow_all.sh
```

update git sub-tree:
```
$ ./subtree.sh pull i3
```

## pkglist

[usage refer](https://github.com/noodlefighter/package-sync)

install from list:
```
$ ./apply-pkgsync.sh
```

