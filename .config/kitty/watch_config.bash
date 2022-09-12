#!/usr/bin/env bash

while true; do
  inotifywait -e create,modify $HOME/.config/kitty
  kill -s SIGUSR1 $(pidof kitty)
done
