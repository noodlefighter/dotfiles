#!/bin/bash

cd "$(dirname "$0")"

do_restow() {
	stow --target=$HOME -R $*
}

do_restow home
do_restow ibus
do_restow private
stow --target=$HOME -R --dir=i3 home/

cd ./rootfs/hosts/
sudo $HOME/bin/replace-file-segment /etc/hosts dotfiles-hosts ./hosts '#'

if [[ -f "./$(hostname)" ]]; then
	sudo $HOME/bin/replace-file-segment /etc/hosts dotfiles-hosts-for-this-host "./$(hostname)" '#'
fi

