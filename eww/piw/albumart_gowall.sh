IGNORED_PLAYERS=firefox

magick -size 256x1 gradient:#8BF6D4-#111716 /tmp/eww-piw-gradient.png

playerctl -i "$IGNORED_PLAYERS" -F metadata mpris:artUrl | while read -r line; do
    if [[ $line =~ ^file:// ]]; then
        ip="${line#file://}"

        magick "$ip" -colorspace gray /tmp/eww-piw-gradient.png -clut /tmp/eww-piw-art.jpg

        echo y

    elif [[ $line =~ ^https:// ]]; then
        tmp_art="/tmp/eww-piw-art-src.jpg"

        # Download the image (Spotify provides a direct image URL)
        curl -fsSL "$line" -o "$tmp_art" || {
            echo n
            continue
        }

        magick "$tmp_art" -colorspace gray /tmp/eww-piw-gradient.png -clut /tmp/eww-piw-art.jpg

        rm "$tmp_art" /tmp/eww-piw-art-invert.jpg

        echo y
    else
        echo n
    fi
done

