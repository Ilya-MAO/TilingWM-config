val=$(cat /sys/class/power_supply/BAT1/capacity)
st=$(cat /sys/class/power_supply/BAT1/status)

if [[ "$val" -le 10 ]]; then
		notify-send "Low battery" -u critical
fi

case "$st" in
	"Full") echo "%{F#9BBFF8}$val%%{F-}" ;;
	"Charging") echo "%{F#C6F8BD}$val%%{F-}" ;;
	"Discharging") echo "%{F#FAC1FA}$val%%{F-}" ;;
esac
