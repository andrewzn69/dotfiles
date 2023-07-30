if pgrep -x spotify >/dev/null; then
    status=$(playerctl -p spotify status)
    if [ "$status" = "Paused" ]; then
        echo '{"text": "Paused"}'
    else
        playerctl -p spotify metadata --format '{"text": "{{markup_escape(title)}} - {{artist}}", "tooltip": "Spotify : {{markup_escape(title)}}", "alt": "{{status}}", "class": "{{status}}"}' -F
    fi
else
    echo '{"text": "No player running"}'
fi
