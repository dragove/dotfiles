if status is-login
  if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
    # exec wayfire
    # exec sway --unsupported-gpu
    # exec Hyprland
    exec niri-session
    # startx
  end
end

if status is-interactive
  abbr vi nvim
  abbr vim nvim
  abbr gs git status
  abbr ga git add
  abbr gf git fetch
  abbr gF git pull
  abbr gp git push
  abbr gco git checkout
  abbr gc git commit -m
  abbr tree lsd --tree
  abbr ls lsd
  abbr ll lsd -hl
  abbr la lsd -ahl
  abbr p paru
  abbr parui "paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -S"
  abbr parur "paru -Qq | fzf --multi --preview 'paru -Qi {1}' | xargs -ro paru -Rns"
end

# fzf
# set -g FZF_DEFAULT_COMMAND "fd --type file --color=always --follow --exclude .git"
set -g FZF_CTRL_T_COMMAND "fd --type f --follow --color=always"
set -g FZF_ALT_C_COMMAND "fd --type d --follow --color=always"
set -g FZF_DEFAULT_OPTS "--ansi"

set -gx PATH "/opt/cuda/bin" $PATH
set -gx PATH "$HOME/.local/bin" $PATH

set --export EDITOR nvim

# pnpm
set -gx PNPM_HOME "/home/dove/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/dove/.ghcup/bin $PATH # ghcup-env

# >>> coursier install directory >>>
set -gx PATH "$HOME/.local/share/coursier/bin" $PATH
# <<< coursier install directory <<<

# >>> scala-cli completions >>>
complete scala -a '(scala complete fish-v1 (math 1 + (count (__fish_print_cmd_args))) (__fish_print_cmd_args))'
# <<< scala-cli completions <<<

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set -gx PATH /home/dove/.local/bin $PATH
