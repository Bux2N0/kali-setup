#!/bin/bash

setxkbmap -layout de

sudo apt update

sudo apt install xlibinput -yy

xinput --set-prop 9 "libinput Natural Scrolling Enabled" 1
xinput --set-prop 9 "libinput Tapping Enabled" 1
