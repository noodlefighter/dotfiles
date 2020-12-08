#!/bin/bash
for P in $( < $1 )
do
    if ! (yay -Q | grep ${P} > /dev/null)
    then
        yay -S ${P} --noconfirm
    fi
done
