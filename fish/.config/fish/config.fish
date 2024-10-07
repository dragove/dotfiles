if status is-interactive
    abbr vi nvim
    abbr vim nvim
    abbr gs git status
    abbr ga git add
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


# pnpm
set -gx PNPM_HOME "/home/dove/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set --export PIXI_INSTALL "$HOME/.pixi"
set --export PATH $PIXI_INSTALL/bin $PATH

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/dove/.ghcup/bin $PATH # ghcup-env

# >>> coursier install directory >>>
set -gx PATH "$PATH:/home/dove/.local/share/coursier/bin"
# <<< coursier install directory <<<
