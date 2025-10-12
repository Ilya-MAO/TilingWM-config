path_tmp="$HOME/.config/polybar/scripts/timer/tmp"
path_exp="$HOME/.config/polybar/scripts/timer/exp"

case "$1" in
	"--start")
		echo "$(( 10#$(date +%d) * 86400 + 10#$(date +%H) * 3600 + 10#$(date +%M) * 60 + 10#$(date +%S) ))" > "$path_tmp" ;;
	"--stop")
		rm -f "$path_tmp" "$path_exp"
		exit 0 ;;
	"-n")
		case "$2" in
			"s") echo "$(( $3 ))" > "$path_exp" ;;
			"m") echo "$(( $3 * 60 + ${4:-0} ))" > "$path_exp" ;;
			"h") echo "$(( $3 * 3600 + ${4:-0} * 60 + ${5:-0} ))" > "$path_exp" ;;
			"d") echo "$(( $3 * 86400 + ${4:-0} * 3600 + ${5:-0} * 60 + ${6:-0} ))" > "$path_exp" ;;
		esac
		echo "$(( 10#$(date +%d) * 86400 + 10#$(date +%H) * 3600 + 10#$(date +%M) * 60 + 10#$(date +%S) ))" > "$path_tmp" ;;
esac

# Якщо час збільшується (відсутній 'ext')
if [[ -s "$path_tmp" ]]; then
	format=$(( 10#$(date +%d) * 86400 + 10#$(date +%H) * 3600 + 10#$(date +%M) * 60 + 10#$(date +%S) - $(cat "$path_tmp") ))
else
	echo ""
	exit 0
fi

# Якщо час зменшується (присутній 'ext')
if [[ -s "$path_exp" ]]; then
	format=$(( $(cat "$path_exp") - $format ))
fi

# При зупинці таймера
if [[ $format -le 0 ]] && [[ -s "$path_exp" ]]; then
	notify-send "Timer message" -u normal
	rm -f "$path_tmp" "$path_exp"
	exit 0;
fi

# Форматування
sec=$(( $format % 60 ))
min=$(( ($format / 60) % 60 ))
hour=$(( ($format / 3600) % 24 ))
day=$(( $format / 86400 ))

# Створення остаточного результату
resform=""
(( $day > 0 )) && resform+=$(printf "%dd " "$day")
(( $hour > 0 )) && resform+=$(printf "%02d:" "$hour")
resform+=$(printf "%02d:%02d" "$min" "$sec")

# Вивід інформації
if [[ "$1" == "--info" ]]; then
	echo "%{T3}%{F#FAC1FA}[$resform]%{F-}%{T}"
fi
