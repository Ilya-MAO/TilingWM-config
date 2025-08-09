res=$(sensors | grep 'Package id 0' | awk '{print $4}' | tr -d '+°C')

echo "%{F#84E4F5} $res%{F-}"
