#!/usr/bin/env bash

waybar &

while true; do
  inotifywait -e create,modify $HOME/.config/waybar/style.css
  kill -s SIGUSR2 $(pidof waybar)
done
