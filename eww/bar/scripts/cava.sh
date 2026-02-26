cava -p /home/endg4me/.config/eww/bar/scripts/cava-config | while read -r line; do
    l=$(echo $line | sed s/";"/","/g | sed s/",$"/""/)
    echo "[$l]"
done