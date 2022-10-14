#!/usr/bin/env bash

tail -f /tmp/wobpipe | wob --bar-color "#98c379ff" --width 1000 --anchor top --margin 20 --border 3 --height 40 --border-color "#ffffffff" --background-color "#000000aa" --padding 3
