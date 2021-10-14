# Defined in /tmp/fish.eNrzwp/th.fish @ line 2
function th
    wal -i $argv
    feh --bg-fill $argv
    cp $argv /home/trent/.currentwallpaper
    pywalfox update
    spicetify update
    /home/trent/Utilities/pywal-discord/pywal-discord
end
