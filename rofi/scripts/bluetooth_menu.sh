choice=$(echo -e "Connect\nDisconnect" | rofi -dmenu -p "Bluetooth mode")

case "$choice" in
	"Connect") bson -c ;;
	"Disconnect") bson -d ;;
esac
