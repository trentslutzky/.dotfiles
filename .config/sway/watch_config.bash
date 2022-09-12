#!/usr/bin/env bash

while true; do
  inotifywait -e create,modify $HOME/.config/sway
  sway reload
done
