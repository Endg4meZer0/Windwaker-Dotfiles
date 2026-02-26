if [[ $1 == "up" ]]; then
    brightnessctl s -n -dintel_backlight 5%+
elif [[ $1 == "down" ]]; then
    brightnessctl s -n -dintel_backlight 5%-
fi
