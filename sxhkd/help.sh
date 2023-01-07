#!bin/sh
cat ~/.config/sxhkd/sxhkdrc | awk ' /^[a-zA-Z]/ && last {print $0,"\t",last} {last=""} /^#/{last=$0} gsub("#", ""){last=$0}' | column -t -s $'\t' | rofi -dmenu -fuzzy -i -theme ~/.config/sxhkd/config.rasi -p "CheatSheat"
