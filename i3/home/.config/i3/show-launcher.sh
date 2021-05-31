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
   -combi-modi window,drun,run -width 30 -lines 10 -columns 1 \
   -separator-style none -font "mono 12" -bw 0 \
   -show-icons \
   -kb-row-select "Tab" -kb-row-tab ""
