#!/usr/bin/env bash

if [[ "$1" == "up" ]]; then
  pamixer -i 5
elif [[ "$1" == "down" ]]; then
  pamixer -d 5
fi

if [[ "$1" == "muted" ]]; then
  if [[ $(pamixer --get-mute) == "false" ]]; then
    echo "墳"
  else
    echo "婢"
  fi
fi

if [[ "$1" == "volume" ]]; then
  if [[ $(pamixer --get-mute) == "false" ]]; then
    pamixer --get-volume
  else
    echo "mt"
  fi
fi

if [[ "$1" == "classname" ]]; then
  if [[ $(pamixer --get-mute) == "false" ]]; then
    echo "volume"
  else
    echo "volume_muted"
  fi
fi

if [[ "$1" == "bar_classname" ]]; then
  if [[ $(pamixer --get-mute) == "false" ]]; then
    echo "volume_bar"
  else
    echo "volume_bar_muted"
  fi
fi
