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
alias mp3='youtube-dl --extract-audio-format" "mp3"'
alias mp4="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4'"

# prompt
PROMPT='%B%F{green}[%f%b''%B%F{white}%~%f%b''%B%F{green}]%f%b''%B%F{green}$%f%b '  
alias config='/usr/bin/git --git-dir=/home/zimn/dotfiles --work-tree=/home/zimn'
