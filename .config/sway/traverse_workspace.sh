#!/usr/bin/env bash


CUR_DISPLAY=$(swaymsg -t get_tree | jq -r --unbuffered --compact-output '
(
    select(.name == "root") |
        first(.focus[]) )')

CUR_WORKSPACE=$(swaymsg -t get_tree | jq -r --unbuffered --compact-output "
(
    select(.name == \"root\") |
    .nodes[] |
    select(.id == $CUR_DISPLAY) |
    .current_workspace )")

TO_WORKSPACE=$CUR_WORKSPACE

if [ $1 == "prev" ]; then
    TO_WORKSPACE=$(expr $CUR_WORKSPACE - 1)
elif [ $1 == "next" ]; then
    TO_WORKSPACE=$(expr $CUR_WORKSPACE + 1)
fi

if [ $1 == "down" ]; then
    TO_WORKSPACE=$(expr $CUR_WORKSPACE + 1)
elif [ $1 == "up" ]; then
    TO_WORKSPACE=$(expr $CUR_WORKSPACE - 1)
fi

if [ $TO_WORKSPACE -eq 11 ]; then
    TO_WORKSPACE=1
elif [ $TO_WORKSPACE -eq 0 ]; then
    TO_WORKSPACE=10
fi

swaymsg workspace number $TO_WORKSPACE
