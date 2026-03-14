# Set hyprshot dir to today's date
ssdir="$HOME/Pictures/Screenshots/$(date +%F)"
mkdir -p "$ssdir"
export HYPRSHOT_DIR="$ssdir"

export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct

# restore wal colors on login
if [[ -f "$HOME/.cache/wal/sequences" ]]; then
  cat "$HOME/.cache/wal/sequences"
fi

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec start-hyprland > /dev/null 2>&1
fi
