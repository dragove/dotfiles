transout=$(crow -b -t zh-CN -- "$(wl-paste -p)")
notify-send -- "$transout"
