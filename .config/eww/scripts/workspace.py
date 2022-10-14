#!/usr/bin/env python

from subprocess import Popen, PIPE
import json

output = Popen(["swaymsg","-t","get_workspaces"],stdout=PIPE)
response = output.communicate()

data_string = response[0]

data = json.loads(data_string)

workspace_widgets = '(box :orientation "v" :class "workspaces"'

workspaces = {}

for i in range(10):
    workspaces[i+1] = {
            "populated":False,
            "focused":False,
            "urgent":False,
            "name":f" {i+1}"
            }

for d in data:
    workspaces[d["num"]]["focused"] = d["focused"]
    workspaces[d["num"]]["populated"] = (d["representation"] != None)
    workspaces[d["num"]]["urgent"] = d["urgent"]
    if d["representation"] != None:
        name = "e"
        reps = []
        reps_str = d["representation"]
        reps_str = reps_str.replace("H[","")
        reps_str = reps_str.replace("V[","")
        reps_str = reps_str.replace("]","")
        reps = reps_str.split(" ")
        if "Spotify" in reps[0]:
            workspaces[d["num"]]["name"] = ""
        if "discord" in reps[0]:
            workspaces[d["num"]]["name"] = "ﭮ"
        if "kitty" in reps[0]:
            workspaces[d["num"]]["name"] = "  "
        if "firefox" in reps[0]:
            workspaces[d["num"]]["name"] = ""
        if reps[0] == "(null)":
            workspaces[d["num"]]["name"] = ""



for workspace in workspaces:
    w = workspaces[workspace]
    classname = '"workspace'
    classname = classname + ("_populated" if w["populated"] else "_empty")
    classname = classname + ("_focus" if w["focused"] else "")
    classname = classname + '"'
    workspace_widgets = workspace_widgets + f" (button :class {classname} :cursor \"pointer\""
    workspace_widgets = workspace_widgets + f" :onclick \"sway workspace {workspace}\" "
    workspace_widgets = workspace_widgets + f" :onmiddleclick \"swaymsg move container to workspace number {workspace}\" \"{w['name']}\") "


workspace_widgets = workspace_widgets + ' ) '

print(workspace_widgets)

