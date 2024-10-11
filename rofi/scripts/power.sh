#!/bin/bash

power="  -> Power off the computer"
reboot="  -> Reboot the system"
lock="  -> Lock the session"
logout="  -> Logout from the session"
mesg="Utilities to manage your system. Press enter to execute. Beware, no confirmation is asked !"
input=$(printf "%s\n%s\n%s\n%s\n" "$power" "$reboot" "$lock" "$logout" | rofi -dmenu -p "   Power " -mesg "$mesg") || exit 1

if [ "$input" = "$power" ]; then
    systemctl poweroff
elif [ "$input" = "$reboot" ]; then
    systemctl reboot
elif [ "$input" = "$lock" ]; then
    hyprlock
elif [ "$input" = "$logout" ]; then
    hyprctl dispatch exit
fi