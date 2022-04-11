# zsh config
HISTFILE=~/.cache/zsh_history
HISTSIZE=5000
SAVEHIST=10000


setopt printexitvalue
setopt CORRECT
setopt CORRECT_ALL


# Prompt
# 'Magenta username' @ 'hostname' 'current dir' ('Git info')
setopt prompt_subst
PROMPT='%F{blue}%n%f@%m %2~ %# '


bindkey -e

# Completion
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# case-insensitive, allow completion from the middle of a word
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
zstyle ':completion:*' menu select=1

autoload -Uz compinit
compinit
# End of lines added by compinstall

# alias
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias ls='ls --color=auto --human-readable --group-directories-first --classify'
alias ll='ls --color=auto --human-readable --group-directories-first --classify -l'
alias la='ls --color=auto --human-readable --group-directories-first --classify -la'
alias vim=nvim
alias vi=nvim

# functions
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# source some plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

