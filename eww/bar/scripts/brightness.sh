get_info() {
    brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
    maxbrightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
    percentage=$(echo "$brightness / $maxbrightness" | bc -l | sed s/"^\."/"0."/)

    echo "{\"val\":$percentage}"
}
get_info;
inotifywait -m -e close_write /sys/class/backlight/intel_backlight/brightness | while read -r line; do
    if [[ $line =~ " CLOSE_WRITE" ]]; then
        get_info;
    fi
done