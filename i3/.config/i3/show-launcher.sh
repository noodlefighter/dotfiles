#!/bin/bash

program_exists() {
    local ret='0'
    command -v $1 >/dev/null 2>&1 || { local ret='1'; }

    # fail on non-zero return value
    if [ "$ret" -ne 0 ]; then
        return 1
    fi

    return 0
}

program_exists rofi
if ! [ $? = 0 ]; then
   dmenu_run
   exit 0
fi

rofi -dpi 1 -show combi \
   -combi-modi run,drun -location 1 -width 100 -lines 10 -columns 1 \
   -separator-style none -font "mono 10" -bw 0 \
   -show-icons \
   -color-window "#222222, #222222, #b1b4b3" \
   -color-normal "#222222, #b1b4b3, #222222, #005577, #b1b4b3" \
   -color-active "#222222, #b1b4b3, #222222, #007763, #b1b4b3" \
   -color-urgent "#222222, #b1b4b3, #222222, #77003d, #b1b4b3" \
   -kb-row-select "Tab" -kb-row-tab ""
