curent=`brightnessctl get`
max=`brightnessctl max`
percent=`($curent * 100 / $max)`

echo $percent
