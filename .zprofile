# Set hyprshot dir to today's date
ssdir="$HOME/Pictures/Screenshots/$(date +%F)"
mkdir -p "$ssdir"
export HYPRSHOT_DIR="$ssdir"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec start-hyprland > /dev/null 2>&1
fi
