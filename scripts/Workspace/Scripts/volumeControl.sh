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
    ;;
esac
