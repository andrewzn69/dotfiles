## PROMPT

# git
autoload -Uz vcs_info
precmd() { vcs_info } 

zstyle ':vcs_info:git:*' formats '%b'

setopt PROMPT_SUBST

# prompt itself
PROMPT='%B%F{green}󰁕 %f%b''%B%F{blue}%~%f%b''%B%F{blue}$(if git rev-parse --git-dir > /dev/null 2>&1; then echo "%F{green} (%f%F{white} $(git rev-parse --abbrev-ref HEAD)%f%F{green})%f"; fi)%f%b '
