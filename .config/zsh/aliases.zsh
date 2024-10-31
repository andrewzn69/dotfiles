## ALIASES

# colors
alias ls='ls --color=auto'
unset RPROMPT

# yay/pacman
alias ins='yay -S'
alias un='yay -Rns'
alias up='yay -Syyu --noconfirm'
alias clean='yay -Scc --noconfirm && yay -Rns $(yay -Qdtq) --noconfirm'

# git
alias d='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias cz='gcz'

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
alias wttr='curl wttr.in'
alias rm='rm -iv'
alias mv='mv -iv'
alias cp='cp -iv'
alias pastebin='nc termbin.com 9999'

# programs
alias qr='cobang'
alias webcam='mpv av://v4l2:/dev/video0 --profile=low-latency --untimed'
alias cal='cal -y'
alias calc='speedcrunch'
alias py='python3'
alias cleandots='antidot clean'

# scripts
alias scrape='bash $HOME/Development/bash-scripts/scrape/scrape.sh'
alias bm='sh $HOME/.config/hypr/scripts/bookmarks'
alias templates='sh $HOME/Development/bash-scripts/templates/templates.sh'
alias gid='bash $HOME/Development/bash-scripts/gid/gid.sh'
alias manual='glow $HOME/docs/Manual/'
alias diskhealth='sudo sh $HOME/Development/bash-scripts/diskhealth/diskhealth.sh'
alias compare='bash $HOME/Development/bash-scripts/compare/compare.sh'
alias randomfilenames='py $HOME/Development/Python/randomfilenames/randomfilenames.py'

# kubernetes
alias h='helm'
alias k='kubectl'
alias kn='kubectl config set-context --current --namespace'

# scripts that i did not want to put in separate files

md() {
	mkdir -p "$@"
	cd "$@"
}

# ffmpeg compress
compress() {
	if [[ -z "$1" ]]; then
		echo "Usage: compress <input_file>"
		return 1
	fi

	input_file="$1"
	extension="${input_file##*.}"
	output_file="${input_file%.*}_compressed.${extension}"

	case "$extension" in
	mp4 | mkv | avi)
		ffmpeg -i "$input_file" -vcodec libx265 -crf 28 "$output_file"
		;;
	jpg | jpeg | png)
		ffmpeg -i "$input_file" -compression_level 100 "$output_file"
		;;
	gif)
		ffmpeg -i "$input_file" -vf "scale=iw/2:ih/2" "$output_file"
		;;
	*)
		echo "Unsupported file format: $extension"
		return 1
		;;
	esac
}
