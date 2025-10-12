choice=$(echo -e "Set\nUnset" | rofi -dmenu -p "Color theme")

case "$choice" in
	"Set") redshift -O 5500 ;;
	"Unset") redshift -x ;;
esac
