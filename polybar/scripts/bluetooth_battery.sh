res=$(bluetoothctl info F1:FA:1A:15:61:93 | grep 'Battery Percentage' | sed -n 's/.*(\([0-9]\+\))/\1/p')

if [ -n "$res" ]; then
	echo "%{F#ffaa5e}󰂯 $res%{F-}"
fi
