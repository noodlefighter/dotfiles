#!/bin/bash

set -e  

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
rm $HOME/.config/fcitx5/profile  # workaround for fcitx5
do_restow home

echo restow private/home ...
stow --target=$HOME -R --dir=private home/

echo restow i3/home ...
stow --target=$HOME -R --dir=i3 home/

echo restow rime ...
RIME_DIR=$HOME/.local/share/fcitx5/rime
mkdir -p "$RIME_DIR"
rm -vrf "$RIME_DIR"
ln -sv "$PWD/rime/" "$RIME_DIR"

echo write hosts file ...
cd ./hosts/
$SUDO $HOME/.local/bin/replace-file-segment /etc/hosts dotfiles-hosts ./hosts '#'
if [[ -e "./$HOST" ]]; then
	$SUDO $HOME/.local/bin/replace-file-segment /etc/hosts dotfiles-hosts-for-this-host "./$(hostname)" '#'
fi
cd - > /dev/null

echo write rootfs files ...
$SUDO cp -vrf rootfs/* /

echo write local rootfs files ...
cp -vrf local_rootfs/* $HOME/.local/

echo copy private/rootfs ...
cd ./private/rootfs/
if [[ -d "./$HOST" ]]; then
  cd $HOST
  $SUDO cp -vrf $PWD/* /
fi
cd - > /dev/null

echo DONE!!!
