## OPTIONS

# history
HISTFILE="$XDG_CONFIG_HOME/zsh/.zhistory"
HISTSIZE="10000"
SAVEHIST="10000"

# completion
autoload -Uz compinit
compinit

# emacs keybindings
bindkey -e
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
