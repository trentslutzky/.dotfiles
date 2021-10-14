# Defined in /tmp/fish.Y2IGQM/assignments.fish @ line 2
function assignments
    echo ''
    cal -n 2
    python ~/Projects/canvas-cli/get_assignments.py
end
