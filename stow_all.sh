#!/bin/bash

HOST=$(hostname)
SUDO=sudo
if [[ $UID == 0 ]]; then
  SUDO=
fi

cd "$(dirname "$0")"


do_restow() {
	stow --target=$HOME -R $*
}

echo restow home...
do_restow home

echo restow ibus...
do_restow ibus

echo restow private/home ...
stow --target=$HOME -R --dir=private home/

echo restow i3/home ...
stow --target=$HOME -R --dir=i3 home/

echo write hosts file ...
cd ./rootfs/hosts/
$SUDO $HOME/bin/replace-file-segment /etc/hosts dotfiles-hosts ./hosts '#'
if [[ -e "./$HOST" ]]; then
	$SUDO $HOME/bin/replace-file-segment /etc/hosts dotfiles-hosts-for-this-host "./$(hostname)" '#'
fi
cd - > /dev/null

echo copy private/rootfs ...
cd ./private/rootfs/
if [[ -d "./$HOST" ]]; then
  cd $HOST
  $SUDO cp -vrf $PWD/* /
fi
cd - > /dev/null

echo DONE!!!
