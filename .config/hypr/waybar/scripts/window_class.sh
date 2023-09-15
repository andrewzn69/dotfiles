app_name=$(swaymsg -t get_tree | jq -r '.. | objects | select(has("focused") and .focused == true) | .app_id' | cut -d"." -f2 | cut -d"-" -f1)

 # Retrieve the PKS from the mapping
  pkg=${PKGS[$app_name]}

  # Echo the symbol if it's not empty
  if [ -n "$pkg" ]; then
    echo "$pkg"
  else
  echo "$app_name"
fi
