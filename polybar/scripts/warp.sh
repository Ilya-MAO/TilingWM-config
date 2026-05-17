st=$(warp-cli status | sed 's/Status update:\ //')

if [ "$st" = "Connected" ]; then
	if [[ "$1" == "-t" ]]; then
		warp-cli disconnect
	else
		echo "%{F#F2E529}󱚿%{F-}"
	fi
else
	if [[ "$1" == "-t" ]]; then
		warp-cli connect
	else
		echo "%{F#b8bebf}󱚿%{F-}"
	fi
fi
