#!/bin/bash

while true; do
	battery_status=$( acpi -b | awk '{print $3}')

	if  [[ "$battery_status" == "Discharging," ]]; then
		battery_level=$(    acpi -b | grep -oP '\d+%' | tr -d '%')

		if     [[ -n $battery_level ]]; then
			if        ((battery_level <= 5)); then
				dunstify           -u critical "$battery_level% Remaining" "Connect charger now"
			elif        ((battery_level == 10)); then
				dunstify           -u normal "$battery_level% Remaining" "Consider charging soon"
			fi
		else
			echo        "Error getting battery level!" >&2
		fi
	elif  [[ "$battery_status" == "Charging," ]]; then
		# Close critical notification if charging
		dunstify     -C
	else
		echo     "Battery is not discharging." >&2
	fi

	# 2 minutes before checking again
	sleep  60
done
