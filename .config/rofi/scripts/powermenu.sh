#!/usr/bin/env bash

# current theme
dir="$HOME/.config/rofi/global"
theme='powermenu'

# cmds
uptime="$(uptime -p | sed -e 's/up //g')"

# Options
hibernate=''
shutdown=''
reboot=''
lock=''
suspend=''
logout=''
yes=''
# no=''

# rofi cmd
rofi_cmd() {
	rofi -dmenu \
		-mesg "Uptime: $uptime" \
		-theme "${dir}"/"${theme}".rasi
}

# confirmation cmd
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-theme "${dir}"/"${theme}".rasi
}

# pass variables to rofi dmenu
run_rofi() {
	echo -e "$suspend\n$reboot\n$shutdown\n$lock\n$logout\n$hibernate" | rofi_cmd
}

# execute command
run_cmd() {
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			systemctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot
		elif [[ $1 == '--hibernate' ]]; then
			bash "$HOME"/Development/bash-scripts/openrgb/openrgb2.sh
			systemctl hibernate
		elif [[ $1 == '--suspend' ]]; then
			bash "$HOME"/Development/bash-scripts/openrgb/openrgb2.sh
			mpc -q pause
			amixer set Master mute
			systemctl suspend
		elif [[ $1 == '--logout' ]]; then
			if [[ "$DESKTOP_SESSION" == 'openbox' ]]; then
				openbox --exit
			elif [[ "$DESKTOP_SESSION" == 'bspwm' ]]; then
				bspc quit
			elif [[ "$DESKTOP_SESSION" == 'i3' ]]; then
				i3-msg exit
			elif [[ "$DESKTOP_SESSION" == 'plasma' ]]; then
				qdbus org.kde.ksmserver /KSMServer logout 0 0 0
			fi
		fi
	else
		exit 0
	fi
}

# actions
chosen="$(run_rofi)"
case ${chosen} in
"$shutdown")
	run_cmd --shutdown
	;;
"$reboot")
	reboot
	;;
"$hibernate")
	hibernate
	;;
"$lock")
	if [[ -x '/usr/bin/betterlockscreen' ]]; then
		betterlockscreen -l
	elif [[ -x '/usr/bin/i3lock' ]]; then
		i3lock
	elif [[ -x '/usr/bin/swaylock' ]]; then
		swaylock -c 000000
	fi
	;;
"$suspend")
	bash "$HOME"/Development/bash-scripts/openrgb/openrgb2.sh
	i3exit suspend
	swaylock -c 000000
	bash "$HOME"/Development/bash-scripts/openrgb/openrgb.sh
	;;
"$logout")
	run_cmd --logout
	;;
esac
