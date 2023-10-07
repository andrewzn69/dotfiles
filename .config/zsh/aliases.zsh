## ALIASES

# colors
alias ls='ls --color=auto'
unset RPROMPT

# alias for yay/pacman
alias ins='yay -S'
alias un='yay -Rns'
alias up='yay -Syyu --noconfirm'
alias clean='yay -Scc --noconfirm && yay -Rns $(yay -Qdtq) --noconfirm'

# git alias for my dotfiles folder
alias d='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# alias for nvim
alias v='nvim'
alias vim='nvim'
alias vi='nvim'
alias oldvim='vim'

# alias for youtube-dlp
alias mp3='yt-dlp --extract-audio --audio-format mp3'
alias mp4='yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4"'

# useful shit
alias mkdir='mkdir -p'
alias la='ls -a'
alias freeram="sudo sh -c 'sync; echo 3 > /proc/sys/vm/drop_caches'"
alias bm='sh $HOME/.config/hypr/scripts/bookmarks'
alias webcam='mpv av://v4l2:/dev/video0 --profile=low-latency --untimed'
