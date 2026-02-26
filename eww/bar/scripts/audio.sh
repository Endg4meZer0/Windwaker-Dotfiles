get_info() {
    info=$(wpctl get-volume @DEFAULT_SINK@)
    vol=$(echo $info | cut -f2 -d" ")
    status=$(echo $info | cut -f3 -d" ")

    muted=false
    muted_class=""
    if [[ $status == "[MUTED]" ]]; then
        muted=true
        muted_class=" muted"
    fi

    extra_class=""
    if [[ $vol > 1 ]]; then
        extra_class=" extra"
    fi

    echo "{\"vol\":$vol,\"muted\":$muted,\"bg\":\"bar-audio-box$muted_class$extra_class\"}"
}
get_info;
pactl subscribe | while read -r line; do
    if [[ $line =~ "change' on sink" || $line =~ "new' on client" ]]; then
        get_info;
    fi
done
