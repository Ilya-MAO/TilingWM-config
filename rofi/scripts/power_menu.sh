choice=$(echo -e "Sleep\nPower off\nReboot" | rofi -dmenu -p "Power mode")

case "$choice" in
	"Sleep") systemctl suspend ;;
	"Power off") systemctl poweroff ;;
	"Reboot") systemctl reboot ;;
esac
