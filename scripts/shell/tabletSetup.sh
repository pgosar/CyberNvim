#!/usr/bin/bash
# Script used strictly when I am using my laptop as a tablet with a second monitor

xrandr --output eDP-1 --auto --primary 
xrandr --output DP-3 --auto
xrandr --output eDP-1 --left-of DP-3

