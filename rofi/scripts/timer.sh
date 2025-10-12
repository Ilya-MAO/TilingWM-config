# Example:
# 
# s 30 - [30]
# m 2 0 - [02:00]; m 5 30 - [05:30]
# h 7 0 0 - [7:00:00]; h 10 0 10 - [10:00:10]
# d 3 0 0 0 - [3][0:00:00]; d 6 10 30 55 - [6][10:30:55]

choice=$(echo -e "Start\nStop\nHelp" | rofi -dmenu -p "Timer (s/m/h/d + time):")

case "$choice" in
	"Start") $HOME/.config/polybar/scripts/timer/main.sh --start ;;
	"Stop") $HOME/.config/polybar/scripts/timer/main.sh --stop ;;
	"Help") alacritty -e nvim $HOME/.config/rofi/scripts/timer.sh ;;
	"") ;;
	*) $HOME/.config/polybar/scripts/timer/main.sh -n $choice 0 ;;
esac
