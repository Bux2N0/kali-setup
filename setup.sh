#!/bin/bash

setxkbmap -layout de

sudo apt update

sudo apt install xinput -yy

xinput --set-prop 9 "libinput Natural Scrolling Enabled" 1
xinput --set-prop 9 "libinput Tapping Enabled" 1

echo "root:root" | chpasswd
echo -e "\033[1;31mroot password changed to root!\033[0m"
