path_tmp="$HOME/.config/polybar/scripts/timer/tmp" # час на момент старту таймера
path_exp="$HOME/.config/polybar/scripts/timer/exp" # час від якого буде йти відлік
path_stop="$HOME/.config/polybar/scripts/timer/stop" # різниця часу на момент зупинки

# Поточний час у вигляді числа
time_to_num() {
	echo "$(( 10#$(date +%d) * 86400 + 10#$(date +%H) * 3600 + 10#$(date +%M) * 60 + 10#$(date +%S) ))"
}

# Головне меню таймера
case "$1" in
	"--get-modes")
		modes=""
		[[ -s "$path_tmp" ]] && [[ -s "$path_stop" ]] && modes+="Continue\n"
		[[ -s "$path_tmp" ]] && [[ ! -s "$path_stop" ]] && modes+="Stop\n"
		[[ -s "$path_tmp" ]] && modes+="Finish\n"
		modes+="Help\nExit"
		echo "$modes"
		exit 0 ;;

	"--continue")
		if [[ -s "$path_stop" ]]; then
			echo $(( "$(time_to_num)" - $(<"$path_stop") )) > "$path_tmp"
			rm -f "$path_stop"
		fi ;;

	"--stop")
		if [[ -s "$path_tmp" ]]; then
			echo $(( "$(time_to_num)" - $(<"$path_tmp") )) > "$path_stop"
		fi ;;

	"--finish")
		rm -f "$path_tmp" "$path_exp" "$path_stop"
		exit 0 ;;

	"-n")
		rm -f "$path_tmp" "$path_exp"
		case "$2" in
			# Час буде зменшуватись
			"s"|"<s") echo "$(( $3 ))" > "$path_exp" ;;
			"m"|"<m") echo "$(( $3 * 60 + ${4:-0} ))" > "$path_exp" ;;
			"h"|"<h") echo "$(( $3 * 3600 + ${4:-0} * 60 + ${5:-0} ))" > "$path_exp" ;;
			"d"|"<d") echo "$(( $3 * 86400 + ${4:-0} * 3600 + ${5:-0} * 60 + ${6:-0} ))" > "$path_exp" ;;

			# Час буде збільшуватись
			"s>") echo "$(( "$(time_to_num)" - $3 ))" > "$path_tmp" ;;
			"m>") echo "$(( "$(time_to_num)" - $3 * 60 - ${4:-0} ))" > "$path_tmp" ;;
			"h>") echo "$(( "$(time_to_num)" - $3 * 3600 - ${4:-0} * 60 - ${5:-0} ))" > "$path_tmp" ;;
			"d>") echo "$(( "$(time_to_num)" - $3 * 86400 - ${4:-0} * 3600 - ${5:-0} * 60 - ${6:-0} ))" > "$path_tmp" ;;
		esac

		if [[ ! -s "$path_tmp" ]]; then
			echo "$(time_to_num)" > "$path_tmp"
		fi ;;
esac

# Якщо таймер зупинений
[[ -s "$path_stop" ]] && exit 0

# Якщо час збільшується (відсутній 'ext')
if [[ -s "$path_tmp" ]]; then
	format=$(( "$(time_to_num)" - $(<"$path_tmp") ))
else
	echo ""
	exit 0
fi

# Якщо час зменшується (присутній 'ext')
if [[ -s "$path_exp" ]]; then
	format=$(( $(<"$path_exp") - $format ))
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
(( $hour > 0 || $day > 0 )) && resform+=$(printf "%02d:" "$hour")
resform+=$(printf "%02d:%02d" "$min" "$sec")

# Вивід інформації
if [[ "$1" == "--info" ]]; then
	echo "%{T3}%{F#FAC1FA}[$resform]%{F-}%{T}"
fi
