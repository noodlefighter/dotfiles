#!/usr/bin/env bash
# Depends on: xdotool, wmctrl

FOCUSED=$(wmctrl -lp | grep $(xprop -root | grep _NET_ACTIVE_WINDOW | head -1 | awk '{print $5}' | sed 's/,//' | sed 's/^0x/0x0/'))
FPID=$(echo $FOCUSED | awk '{print $3}')
FNME=$(echo $FOCUSED | cut -f -4  -d ' ' --complement)

TITLE=`rofi -dpi 1 -dmenu -lines 0 -separator-style none -p "Set Title"`
if ! [ $? = 0 ]; then
	exit 1
fi

if [ -z $TITLE ]; then
	i3-msg border pixel 2
	exit 0
fi

xdotool search -all --pid $FPID --name "$FNME" set_window -name "$TITLE"

i3-msg border normal
