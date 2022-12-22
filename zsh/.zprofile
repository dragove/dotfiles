if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  # exec wayfire
  # exec sway --unsupported-gpu
  exec Hyprland
fi

