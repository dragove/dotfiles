if [[ ":$FPATH:" != *":/home/dove/.zsh/completions:"* ]]; then export FPATH="/home/dove/.zsh/completions:$FPATH"; fi
# zsh config
HISTFILE=~/.cache/zsh_history
HISTSIZE=5000
SAVEHIST=10000


setopt printexitvalue
setopt CORRECT
setopt CORRECT_ALL


autoload -U colors
colors
# Simple Prompt username@hostname dir %
setopt prompt_subst
PROMPT='%F{blue}%n%f@%m %2~ > '

# use autocde
setopt  autocd
# Use Emacs keybindings
bindkey -e

# Completion
zstyle ':completion:*' menu select 
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
autoload -Uz compinit
compinit


# alias
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias tree='lsd --tree'
alias ls='lsd'
alias ll='lsd -hl'
alias la='ls -ahl'
alias vim=nvim
alias vi=nvim
alias lg=lazygit
alias parui="paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -S"
alias parur="paru -Qq | fzf --multi --preview 'paru -Qi {1}' | xargs -ro paru -Rns"
if [[ "$TERM" == "xterm-kitty" ]] then
  alias ssh="kitty +kitten ssh"
fi

# source some plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh


. "$HOME/.cargo/env"
# Added by git-ai installer on Wed Feb 11 12:46:00 CST 2026
export PATH="/home/dove/.git-ai/bin:$PATH"
