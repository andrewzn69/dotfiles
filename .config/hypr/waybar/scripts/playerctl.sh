#!/bin/bash

FORMAT="{{ title }} - {{ artist }}"

playerctl_status=$(playerctl status 2>/dev/null)

if [[ $playerctl_status == "Playing" ]]; then
    playerctl --player=$PLATER metadata --format "$FORMAT"
elif [[ $playerctl_status == "Paused" ]]; then
    playerctl --player=$PLATER metadata --format "$FORMAT"
else
    echo 'No Player Found'
fi
