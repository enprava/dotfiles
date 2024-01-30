#!/bin/bash

current_layout=$(hyprctl devices -j |
  jq -r '.keyboards[] | .active_keymap' |
  head -n1 |
  cut -c1-2 |
  tr 'a-z' 'A-Z')

if [ "$current_layout" == "EN" ]; then
    hyprctl keyword input:kb_layout es
    echo "Switched to Spanish keyboard layout."
elif [ "$current_layout" == "SP" ]; then
    hyprctl keyword input:kb_layout us
    echo "Switched to English keyboard layout."
else
    echo "Unknown keyboard layout: $current_layout"
fi

waybar_pid=$(pgrep waybar)
kill -SIGRTMIN+1 $waybar_pid