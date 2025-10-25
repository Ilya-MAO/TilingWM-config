# Example:
#
# default: <
# 
# <s 30			 [30] ~ [29]
# m 2			 [02:00] ~ [01:59]
# <m 5 30		 [05:30] ~ [05:29]
# h> 7			 [7:00:00] ~ [7:00:01]
# <h 10 0 10	 [10:00:10] ~ [10:00:09]
# d 3			 [3d 0:00:00] ~ [2d 23:59:59]
# d> 6 10 30 55	 [6d 10:30:55] ~ [6d 10:30:56]

choice=$(echo -e "Stop\nHelp" | rofi -dmenu -p "Timer (<|mode|> + time):")

case "$choice" in
	"Stop") $HOME/.config/polybar/scripts/timer/main.sh --stop ;;
	"Help") alacritty -e nvim $HOME/.config/rofi/scripts/timer.sh ;;
	"") ;;
	*) $HOME/.config/polybar/scripts/timer/main.sh -n $choice ;;
esac
