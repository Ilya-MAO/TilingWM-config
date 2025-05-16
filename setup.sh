tl_path="$HOME/.tiling-config"
cf_path="$HOME/.config"


mkdir -p "$cf_path/bspwm/"
mkdir -p "$cf_path/sxhkd/scripts/"
mkdir "$cf_path/picom/"
mkdir -p "$cf_path/polybar/scripts/"
mkdir "$cf_path/alacritty/"

ln -sf "$tl_path/bspwm/bspwmrc" "$cf_path/bspwm/bspwmrc"
ln -sf "$tl_path/sxhkd/sxhkdrc" "$cf_path/sxhkd/sxhkdrc"
ln -sf "$tl_path/picom/picom.conf" "$cf_path/picom/picom.conf"
ln -sf "$tl_path/polybar/config.ini" "$cf_path/polybar/config.ini"
ln -sf "$tl_path/alacritty/alacritty.toml" "$cf_path/alacritty/alacritty.toml"

ln -sf "$tl_path/polybar/scripts/light.sh" "$cf_path/polybar/scripts/light.sh"
ln -sf "$tl_path/sxhkd/scripts/language.sh" "$cf_path/sxhkd/scripts/language.sh"
