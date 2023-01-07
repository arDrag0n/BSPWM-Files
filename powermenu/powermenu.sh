# #!/usr/bin/env bash

# Determine `systemd-logind` or `(e)logind`.


uptime=$(uptime -p | sed 's/up //' | sed 's/\ years\?,/y/' | sed 's/\ weeks\?,/w/' | sed 's/\ days\?,/d/' | sed 's/\ hours\?,\?/h/' | sed 's/\ minutes\?/m/')
ROFI="rofi -theme ~/.config/powermenu/themes/power.rasi" 

A='' B='' C='' D='' E=''

MENU="$(printf "${A}\n${B}\n${C}\n${D}\n${E}\n" | ${ROFI} -dmenu -p "Up - $uptime" -selected-row 0)"

case "$MENU" in
    "$A") systemctl poweroff
    ;;
    "$B") systemctl reboot
    ;;
    "$C") betterlockscreen -l
    ;;
    "$D") if [[ "$("$MUSIC_CONTROLLER" status)" = *'laying'* ]]; then
              "$MUSIC_CONTROLLER" toggle
          fi
          exec "$SEATCTL" suspend
    ;;
    "$E") bspc quit
    ;;
esac 

exit ${?}
