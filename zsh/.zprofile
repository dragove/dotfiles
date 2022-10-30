export QT_QPA_PLATFORMTHEME=qt5ct
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  # exec sway --unsupported-gpu
  exec Hyprland
fi

