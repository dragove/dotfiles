if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  # exec sway --unsupported-gpu
  # sleep 2
  exec Hyprland
fi

