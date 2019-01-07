#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$DIR/.current_display"

if [ "$DISPLAY_SETTING" == "off" ]
then
    echo 'DISPLAY_SETTING="duplicate"' > "$DIR/.current_display"
    xrandr --output HDMI-1-1 --mode 1024x768 --same-as eDP-1-1
elif [ "$DISPLAY_SETTING" == "duplicate" ]
then
    echo 'DISPLAY_SETTING="extend"' > "$DIR/.current_display"
    xrandr --output HDMI-1-1 --auto --left-of eDP-1-1
elif [ "$DISPLAY_SETTING" == "extend" ]
then
    echo 'DISPLAY_SETTING="second"' > "$DIR/.current_display"
    xrandr --output eDP-1-1 --off
    xrandr --output HDMI-1-1 --auto
elif [ "$DISPLAY_SETTING" == "second" ]
then
    echo 'DISPLAY_SETTING="off"' > "$DIR/.current_display"
    xrandr --output eDP-1-1 --auto
    xrandr --output HDMI-1-1 --off
else
    echo 'DISPLAY_SETTING="duplicate"' > "$DIR/.current_display"
    xrandr --output HDMI-1-1 --mode 1024x768 --same-as eDP-1-1
fi
