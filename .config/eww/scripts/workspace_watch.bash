#!/usr/bin/env bash

$HOME/.config/eww/scripts/workspace.py
while true; do
  swaymsg -q -t subscribe "[\"workspace\",\"window\"]"
  $HOME/.config/eww/scripts/workspace.py
done
