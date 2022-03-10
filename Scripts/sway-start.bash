#!/usr/bin/env bash

export MOZ_ENABLE_WAYLAND=1
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway

exec sway
