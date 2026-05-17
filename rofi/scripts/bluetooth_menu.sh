choice=$(echo -e "Connect\nDisconnect" | rofi -dmenu -p "Bluetooth mode")

case "$choice" in
	"Connect") alacritty -e bson -c ;;
	"Disconnect") alacritty -e bson -d ;;
esac
