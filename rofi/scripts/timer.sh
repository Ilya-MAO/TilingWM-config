# За замовченням: <mode
#
# Приклади введення часу:
# 
# <s 30          [30] ~ [29]
# m 2            [02:00] ~ [01:59]
# <m 5 30        [05:30] ~ [05:29]
# h> 7           [7:00:00] ~ [7:00:01]
# <h 10 0 10     [10:00:10] ~ [10:00:09]
# d 3            [3d 0:00:00] ~ [2d 23:59:59]
# d> 6 10 30 55  [6d 10:30:55] ~ [6d 10:30:56]

timer="$HOME/.config/polybar/scripts/timer/main.sh"

choice=$(echo -e "$($timer --get-modes)" | rofi -dmenu -p "Timer (<|mode|> + time):")

case "$choice" in
	"Continue") "$timer" --continue ;; # продовжити після 'Stop'
	"Stop") "$timer" --stop ;; # призупинити таймер
	"Finish") "$timer" --finish ;; # завершити таймер
	"Help") alacritty -e nvim "$HOME/.config/rofi/scripts/timer.sh" ;; # відкриття підсказки
	""|"Exit") ;; # для виходу з меню завдяки `ESC` або `Exit`
	*) "$timer" -n $choice ;; # введення часу
esac
