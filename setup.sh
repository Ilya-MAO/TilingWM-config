tl_path="$HOME/.tiling-config"
cf_path="$HOME/.config"

mkdir -p "$cf_path/bspwm/"
mkdir -p "$cf_path/sxhkd/"
mkdir -p "$cf_path/picom/"
mkdir -p "$cf_path/alacritty/"
mkdir -p "$cf_path/polybar/scripts/"
mkdir -p "$cf_path/rofi/themes/"

echo -e "Директорії створено!"

ln -sf "$tl_path/bspwm/bspwmrc" "$cf_path/bspwm/bspwmrc" && echo -e "\nbspwm встановлено"
ln -sf "$tl_path/sxhkd/sxhkdrc" "$cf_path/sxhkd/sxhkdrc" && echo "sxhkd встановлено"
ln -sf "$tl_path/picom/picom.conf" "$cf_path/picom/picom.conf" && echo "picom встановлено"
ln -sf "$tl_path/alacritty/alacritty.toml" "$cf_path/alacritty/alacritty.toml" && echo "alacritty встановлено"
ln -sf "$tl_path/polybar/config.ini" "$cf_path/polybar/config.ini" && echo "polybar встановлено"
ln -sf "$tl_path/rofi/config.rasi" "$cf_path/rofi/config.rasi" && echo "rofi встановлено"

ln -sf "$tl_path/rofi/themes/squared-material-red.rasi" "$cf_path/rofi/themes/squared-material-red.rasi" && echo -e "\nТема на rofi встановлена"

ln -sf "$tl_path/polybar/scripts/bluetooth_battery.sh" "$cf_path/polybar/scripts/bluetooth_battery.sh" && echo -e "\nСкрипт bluetooth_battery.sh встановлено"
ln -sf "$tl_path/polybar/scripts/cpu_temp.sh" "$cf_path/polybar/scripts/cpu_temp.sh" && echo "Скрипт cpu_temp.sh встановлено"
ln -sf "$tl_path/polybar/scripts/language.sh" "$cf_path/polybar/scripts/language.sh" && echo "Скрипт language.sh встановлено"
ln -sf "$tl_path/polybar/scripts/light.sh" "$cf_path/polybar/scripts/light.sh" && echo "Скрипт light.sh встановлено"
ln -sf "$tl_path/polybar/scripts/music.sh" "$cf_path/polybar/scripts/music.sh" && echo "Скрипт music.sh встановлено"

echo -e "\nКонфігурація встановлена!"
