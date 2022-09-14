export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORM=wayland
export QT_STYLE_OVERRIDE=kvantum
# export SDL_VIDEODRIVER=wayland
export MOZ_ENABLE_WAYLAND=1
export _JAVA_AWT_WM_NONREPARENTING=1
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  # exec sway --unsupported-gpu
  exec Hyprland
fi

