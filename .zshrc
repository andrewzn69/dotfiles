export ZSH="$HOME/.oh-my-zsh"

plugins=(
git
zsh-autosuggestions
zsh-completions
)

source $ZSH/oh-my-zsh.sh

(cat ~/.cache/wal/sequences &)

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias ls='ls --color=auto'
unset RPROMPT

# alias for nvim
alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"

# prompt
PROMPT='%B%F{green}[%f%b''%B%F{white}%~%f%b''%B%F{green}]%f%b''%B%F{green}$%f%b '  
alias config='/usr/bin/git --git-dir=/home/zimn/dotfiles --work-tree=/home/zimn'
