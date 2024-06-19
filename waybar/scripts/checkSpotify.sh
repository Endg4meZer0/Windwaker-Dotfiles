SPOTIFY_STATUS="No players found\n"

if [ "$(playerctl --player=spotify status)" = "$SPOTIFY_DATA" ]; then
	echo "{\"text\":\":(\",\"alt\":\"None\",\"tooltip\":\"Nothing is playing\",\"class\":[\"None\"]}"
else
	echo "{\"text\":\"$(playerctl --player=spotify metadata artist) - $(playerctl --player=spotify metadata title)\",\"alt\":\"$(playerctl --player=spotify status)\",\"tooltip\":\"$(playerctl --player=spotify metadata album)\",\"class\":[\"$(playerctl --player=spotify status)\"]}"
fi
