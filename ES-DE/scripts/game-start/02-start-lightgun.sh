#!/bin/bash


declare -a games=("area51.zip" "lethalen.zip" "le2.zip" "ptblank.zip" "hotd.zip" "timecris.zip")

for game in "${games[@]}"; do
    if [ "${1##*/}" = $game ]; then
       echo "lightgun game"

       cmd="mono /home/travis/Sinden/LightgunMono.exe joystick"

       while true; do
	   echo "Starting lightgun"
	   $cmd &
	   pid=$!

	   # Give the process a moment to crash if it's going to
	   sleep 1

	   if kill -0 "$pid" 2>/dev/null; then
	       echo "Started lightgun successfully with PID $pid"
	       break
	   else
	       echo "Lightgun not found, retrying"
	   fi
       done

       # Detach from shell so it stays alive after script exits
       disown "$pid"

       echo "Backgrounded. Exiting script."
    fi
done

exit 0
