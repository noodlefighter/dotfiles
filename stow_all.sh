#!/bin/bash

cd "$(dirname "$0")"

do_restow() {
	stow --target=$HOME -R $*
}

do_restow home
do_restow ibus
stow --target=$HOME/.config -R --dir=i3 .config



