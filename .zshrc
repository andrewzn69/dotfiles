# general
export ZSH="$HOME/.oh-my-zsh"
export PATH=/home/zimn/.cargo/bin:$PATH
export EDITOR=nvim

# pfetch
export PF_INFO="ascii title os uptime pkgs"
export PF_ASCII="Catppuccin"
export PF_COL1=7
export PF_COL3=5

# removes background color for mounted directories
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"

# plugins
plugins=(
git
zsh-autosuggestions
zsh-completions
)

source $ZSH/oh-my-zsh.sh

# colors
alias ls='ls --color=auto'
unset RPROMPT

# alias for yay/pacman
alias ins="yay -S"
alias un="yay -R"
alias up='yay -Syyu'

# git alias for my dotfiles folder
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# alias for nvim
alias v="nvim"
alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"

# alias for youtube-dl
alias mp3='yt-dlp --extract-audio --audio-format mp3'
alias mp4='yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4"'

# prompt (git)
autoload -Uz vcs_info
precmd() { vcs_info } 

zstyle ':vcs_info:git:*' formats '%b'

setopt PROMPT_SUBST

# prompt
PROMPT='%B%F{green}󰁕 %f%b''%B%F{blue}%~%f%b''%B%F{blue}$(if git rev-parse --git-dir > /dev/null 2>&1; then echo "%F{green} (%f%F{white} $(git rev-parse --abbrev-ref HEAD)%f%F{green})%f"; fi)%f%b '
