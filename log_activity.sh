#!/bin/bash
LOGPATH=/home/vitabenes/projects/_dormant/various/activity_log.jsonl
# JSON date format
DATEFORMAT="%Y-%m-%dT%TZ"
function recordWindowTitle {
	# getting id of a process running in currently focused window
	PID=$(xprop -id `xdotool getwindowfocus` | grep '_NET_WM_PID' | grep -oE '[[:digit:]]*$')
	# extracting a name of the focused window process
	PNAME=$(ps -p $PID -o comm=)
	# appending date, name of the active application and a number of times
	# that the loop has run since the script was run
	DATASTRING="["\"$(date +"$DATEFORMAT")"\",\""$PNAME"\", \"$run_times\"]"
	echo $DATASTRING>>$LOGPATH
}
# a number of times the while loop has run
run_times=0
# create log file if one does not exist
if [ ! -f $LOGPATH ]
  then
    CELLDEFINITION="[\"Date\", \"Application Name\", \"Loop #\"]"
		echo $CELLDEFINITION>>$LOGPATH
fi
while true
do
	recordWindowTitle
	sleep 2m
	((run_times++))
done
