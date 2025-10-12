mus_volume=$(amixer get Master | grep -o -m 1 '[0-9]\+%' | tr -d '%')
mus_mute=$(amixer get Master | grep -o -m 1 '\[[a-z]\+\]' | tr -d '[]') # 'on' is not mute
mus_status=$(playerctl status 2>/dev/null)

if [ "$mus_status" = "No players found" ] || [ -z "$mus_status" ]; then
	if [ "$mus_mute" = "on" ]; then
		echo "%{F#D2D8D9}  $mus_volume%{F-}"
	else
		echo "%{F#b8bebf}  $mus_volume%{F-}"
	fi
else
	if [ "$mus_mute" = "off" ]; then
		echo "%{F#b8bebf}  $mus_volume%{F-}"
	elif [ "$mus_status" = "Paused" ]; then
		echo "%{F#FDE003} $mus_volume%{F-}"
	elif [ "$mus_status" = "Playing" ]; then
		echo "%{F#B2D977} $mus_volume%{F-}"
	fi
fi
