export ZSH="$HOME/.oh-my-zsh"
export PATH=/home/zimn/.cargo/bin:$PATH
export EDITOR=nvim

plugins=(
git
zsh-autosuggestions
zsh-completions
)

source $ZSH/oh-my-zsh.sh

# colors
alias red='bash ~/Development/Bash/openrgb.sh clear'
alias hib='bash ~/Development/Bash/openrgb2.sh clear'
alias ls='ls --color=auto'
unset RPROMPT

# git alias for my dotfiles folder
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# alias for nvim
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
PROMPT='%B%F{green}[%f%b''%B%F{white}%~%f%b''%B%F{green}]%f%b''%B%F{white}$(if git rev-parse --git-dir > /dev/null 2>&1; then echo "%F{green}(%f$(git rev-parse --abbrev-ref HEAD)%F{green})%f"; fi)%f%b''%B%F{green}$%f%b '
