export PATH=$PATH:~/Workspace/Scripts:~/.local/bin
export QT_STYLE_OVERRIDE=kvantum
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

