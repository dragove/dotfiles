export PATH=$PATH:~/Workspace/Scripts:~/.local/bin
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORM=wayland
export SDL_VIDEODRIVER=wayland
export MOZ_ENABLE_WAYLAND=1
export _JAVA_AWT_WM_NONREPARENTING=1
export EDITOR=nvim
export VISUAL=nvim
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec sway --unsupported-gpu
fi

