#!/usr/bin/env bash
#[target] /home/tls/.config/sway/wob_launcher.bash

tail -f /tmp/wobpipe | wob --bar-color "{{color2}}ff" --width 1000 --anchor top --margin 20 --border 3 --height 40 --border-color "#ffffffff" --background-color "#000000aa" --padding 3
