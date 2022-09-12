#!/usr/bin/env bash

while true; do
  inotifywait -e create,modify $HOME/.config/fish
  $HOME/.config/fish/set_colors
done
