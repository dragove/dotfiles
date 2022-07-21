#!/usr/bin/env bash

# You can call this script like this:
# $ ./volumeControl.sh up
# $ ./volumeControl.sh down
# $ ./volumeControl.sh mute

# Script modified from these wonderful people:
# https://github.com/dastorm/volume-notification-dunst/blob/master/volume.sh
# https://gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a

function get_volume {
  pamixer --get-volume
}

function is_mute {
    res=$(pamixer --get-mute)
    $res
}

function send_notification {
  iconSound="audio-volume-high"
  iconMuted="audio-volume-muted"
  notify_path="$XDG_RUNTIME_DIR"/.volume_notif
  notif=$(flock "$notify_path" cat "$notify_path")
  if ! echo "$notif" | grep "[[:digit:]]"; then
      notif=444
  fi
  if  is_mute ; then
    notify-send -i $iconMuted -p -r "$notif" "mute" > "$notify_path"
  else
    volume=$(get_volume)
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    bar=$(seq --separator="─" 0 "$((volume / 5))" | sed 's/[0-9]//g')
    # Send the notification
    notify-send -i $iconSound -p -r "$notif" "$bar" > "$notify_path"
  fi
}

case $1 in
  up)
    # set the volume on (if it was muted)
    pamixer -i 5
    send_notification
    ;;
  down)
    pamixer -d 5
    send_notification
    ;;
  mute)
    # toggle mute
    if is_mute ; then
        pamixer -u
    else
        pamixer -m
    fi
    send_notification
    ;;
esac
