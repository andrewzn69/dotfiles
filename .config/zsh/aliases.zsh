## ALIASES

# colors
alias ls='ls --color=auto'
unset RPROMPT

# yay/pacman
alias ins='yay -S'
alias un='yay -Rns'
alias up='yay -Syyu --noconfirm'
alias clean='yay -Scc --noconfirm && yay -Rns $(yay -Qdtq) --noconfirm'

# git alias for my dotfiles folder
alias d='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# nvim
alias v='nvim'
alias vim='nvim'
alias vi='nvim'
alias oldvim='vim'

# youtube-dlp
alias mp3='yt-dlp --extract-audio --audio-format mp3'
alias mp4='yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4"'

# wifi
alias 11='fping -l 1.1.1.1 archlinux.org google.com 192.168.192.168'
alias wconnect='nmcli dev wifi connect'
alias wscan='nmcli dev wifi rescan'

# useful shit
alias mkdir='mkdir -p'
alias la='ls -a'
alias freeram="sudo sh -c 'sync; echo 3 > /proc/sys/vm/drop_caches'"

alias bm='sh $HOME/.config/hypr/scripts/bookmarks'
alias wttr='curl wttr.in'

# programs
alias qr='cobang'
alias webcam='mpv av://v4l2:/dev/video0 --profile=low-latency --untimed'
alias calc='speedcrunch'
alias cal='calcurse'

# kubernetes
alias h='helm'
alias k='kubectl'
alias kn='kubectl config set-context --current --namespace'
