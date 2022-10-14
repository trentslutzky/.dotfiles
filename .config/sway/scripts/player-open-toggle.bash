#!/usr/bin/env bash

# if spotify is not openend, move to workspace 10 and open spotify. otherwise toggle play-pause.

PLAYER_STATUS=$(playerctl status 2>/dev/null)

if [[ $PLAYER_STATUS == "" ]]; then
  swaymsg workspace 10
  wait 1
  spotify & disown spotify
else
  playerctl play-pause
fi

