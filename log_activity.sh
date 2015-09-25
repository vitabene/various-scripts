#!/bin/bash
function getWindowTitle {
	# getting id of a process running in currently focused window
	PID=$(xprop -id `xdotool getwindowfocus` | grep '_NET_WM_PID' | grep -oE '[[:digit:]]*$')
	# extracting a name of the focused window process
	PNAME=$(ps -p $PID -o comm=)
	# appending date, name of the active application and a number of times
	# that the loop has run since the script was run
	echo "["$(date +"%d-%m-%y_%T")"]["$PNAME"][$run_times]">>~/activity_log/activity_log.txt
}
# a number of times the while loop has run
run_times=0
while true
do
	getWindowTitle
	sleep 1m
	((run_times++))
done
