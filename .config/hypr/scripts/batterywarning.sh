#!/bin/bash

while true; do
    battery_level=$(acpi --battery | grep -oP '\d+%' | tr -d '%')

    if [[ -n $battery_level ]]; then
        if (( battery_level <= 5 )); then
            dunstify -u critical "$battery_level% Remaining" "Connect charger now"
        elif (( battery_level == 10 )); then
            dunstify -u normal "$battery_level% Remaining" "Consider charging soon"
        else echo "" >&2
        fi
    else
        echo "Error getting battery level!" >&2
    fi

    # Sleep for a while before checking again (e.g., every 2 minutes)
    sleep 120  # 120 seconds (2 minutes)
done
