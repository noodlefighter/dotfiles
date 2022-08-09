#!/bin/bash

set -e  

HOST=$(hostname)
SUDO=sudo
if [[ $UID == 0 ]]; then
  SUDO=
fi

DOTBOT=./dotbot/bin/dotbot 

cd "$(dirname "$0")"

echo install home...
$DOTBOT -c install.conf.yaml

echo install private/home ...
$DOTBOT -c private/install.conf.yaml

echo install i3/home ...
$DOTBOT -c i3/install.conf.yaml


echo write hosts file ...
cd ./hosts/
$SUDO $HOME/bin/replace-file-segment /etc/hosts dotfiles-hosts ./hosts '#'
if [[ -e "./$HOST" ]]; then
	$SUDO $HOME/bin/replace-file-segment /etc/hosts dotfiles-hosts-for-this-host "./$(hostname)" '#'
fi
cd - > /dev/null

echo write rootfs files ...
$SUDO cp -vrf rootfs/* /

echo copy private/rootfs ...
cd ./private/rootfs/
if [[ -d "./$HOST" ]]; then
  cd $HOST
  $SUDO cp -vrf $PWD/* /
fi
cd - > /dev/null

echo DONE!!!
