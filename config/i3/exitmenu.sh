#!/bin/bash
while [ "$select" != "CANCEL" -a "$select" != "LOGOUT" -a "$select" != "POWEROFF" -a "$select" != "REBOOT" ];
do
	select=$(echo -e 'CANCEL\nLOGOUT\nPOWEROFF\nREBOOT' | dmenu -nb '#2E3440' -nf '#ffffff' -sb '#3c4454' -sf '#ffffff' -fn '-*-*-medium-r-normal-*-*-*-*-*-*-100-*-*'"                          ")
	[ -z "$select" ] && exit 0
done
[ "$select" = "CANCEL" ] && exit 0
[ "$select" = "LOGOUT" ] && i3-msg exit
[ "$select" = "POWEROFF" ] && exec shutdown -P 0
[ "$select" = "REBOOT" ] && exec systemctl reboot


#[ "$select" = "POWEROFF" ] && /usr/bin/dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop
#[ "$select" = "REBOOT" ] && /usr/bin/dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Restart