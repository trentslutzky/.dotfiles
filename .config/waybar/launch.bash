#!/bin/bash

while true; do
  waybar &
  inotifywait -e create,modify $HOME/.config/waybar/ $HOME/.cache/wal/
  killall waybar
done
