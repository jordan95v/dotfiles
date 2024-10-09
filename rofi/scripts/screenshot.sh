#!/bin/bash

filename=$(date +'%s_grim.png')
all="󰹑  -> All outputs"
all_clip="󰆏  -> Copy all outputs to clipboard"
select="  -> Select region"
select_clip="  -> Copy selected region to clipboard"
mesg="Utility to screenshot entire output or region of your screen. Choose one and press enter. The screenshot will then fire after one second, the time needed for the menu to close."
input=$(printf "%s\n%s\n%s\n%s\n" "$all" "$all_clip" "$select" "$select_clip" | rofi -dmenu -p " 󰤨  Screenshot " -mesg "$mesg") || exit 1
sleep 1 # to close rofi menu

if [ "$input" = "$all" ]; then
    grim
    notify-send Screenshot "Saved to $filename."
elif [ "$input" = "$all_clip" ]; then
    grim - | wl-copy
    notify-send Screenshot "All outputs copied to clipboard."
elif [ "$input" = "$select" ]; then
    grim -g "$(slurp)"
    notify-send Screenshot "Saved to $filename."
elif [ "$input" = "$select_clip" ]; then
    grim -g "$(slurp)" - | wl-copy
    notify-send Screenshot "Selected region copied to clipboard."
fi

exit 0