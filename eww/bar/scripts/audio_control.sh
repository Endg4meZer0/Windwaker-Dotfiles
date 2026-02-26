if [[ $1 == "mute" ]]; then
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
elif [[ $1 == "up" ]]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
elif [[ $1 == "down" ]]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
fi