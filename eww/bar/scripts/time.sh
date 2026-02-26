time=$(date +"%H%M%S %y%m%d %a")
clock=$(echo $time | cut -f1 -d" ")
date=$(echo $time | cut -f2 -d" ")
weekday=$(echo $time | cut -f3 -d" " | tr '[:lower:]' '[:upper:]')
echo "{\"cl\":\"$clock\",\"dt\":\"$date\",\"wd\":\"$weekday\"}"