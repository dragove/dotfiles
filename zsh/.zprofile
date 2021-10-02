export PATH=$PATH:~/Workspace/Scripts:~/.local/bin
export QT_QPA_PLATFORMTHEME=qt5ct
export EDITOR=nvim
export VISUAL=nvim
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

