val=$(cat /sys/class/power_supply/BAT1/capacity)
st=$(cat /sys/class/power_supply/BAT1/status)

if [ "$val" -le 10 ] && [ "$st" = "Discharging" ]; then
	notify-send "Low battery" -u critical --wait
fi

case "$choice" in
	"Sleep mode") systemctl suspend ;;
	"Power off") systemctl poweroff ;;
esac
