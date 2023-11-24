## PATH & ENV VARIABLES

# zsh
export ZSH="$HOME/.oh-my-zsh"
export PATH=/home/zimn/.cargo/bin:$PATH

# prompts
export SUDO_PROMPT="password: "

# programs
export TERMINAL="kitty"
export BROWSER="firefox"
export VISUAL="nvim"
export EDITOR="nvim"
export MANPAGER="nvim +Man!"

# pfetch
export PF_INFO="ascii title os uptime pkgs"
export PF_ASCII="Catppuccin"
export PF_COL1=7
export PF_COL3=5

# xdg
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_DATA_DIRS="/usr/local/share:/usr/share:/var/lib/flatpak/exports/share:$XDG_DATA_HOME/flatpak/exports/share"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"

# removes background color for mounted directories, because it is fucking unreadable
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"

# gtfo
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

export PATH="/usr/bin:$PATH"
