stuff=$(acpi | cut -f2 -d":" | sed s/"^ "/""/)
status=$(echo $stuff | cut -f1 -d"," | sed s/"^ "/""/)
amount=$(echo $stuff | cut -f2 -d"," | sed s/"^ "/""/ | sed s/"%"/""/)
timeremaining=$(echo $stuff | cut -f3 -d", " | sed s/"^ "/""/)

# Background classes
if [[ $status == "Discharging" || $status == "Not charging" ]]; then
    if [[ $amount -le 10 ]]; then
        boxclasses="bar-battery-box critical"
    elif [[ $amount -le 20 ]]; then
        boxclasses="bar-battery-box warning"
    else
        boxclasses="bar-battery-box"
    fi
elif [[ $status == "Charging" ]]; then
    boxclasses="bar-battery-box charging"
else
    boxclasses="bar-battery-box stale"
fi

echo "{\"box\":\"$boxclasses\",\"status\":\"$status\",\"amount\":$amount,\"timerem\":\"$timeremaining\"}"
