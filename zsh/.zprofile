if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  # exec sway --unsupported-gpu
  exec Hyprland
  # exec startx
fi

