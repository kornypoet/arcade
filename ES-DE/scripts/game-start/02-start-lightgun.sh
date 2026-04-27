#!/bin/bash

mame_games=(
    'area51.zip'
    'hotd.zip'
    'lethalen.zip'
    'le2.zip'
    'ptblank.zip'
    'timecris.zip'
)

retroarch_games=(
    'Duck Hunt (World).nes'
)

cmd="mono /home/travis/Sinden/LightgunMono.exe"
name="${1##*/}"
lightgun=false

echo "Checking if ${name} requires lightgun"

for game in "${mame_games[@]}"; do
    if [ "${name}" = "${game}" ]; then
	echo "Found mame lightgun game"

	cmd="${cmd} joystick"
	lightgun=true
    fi
done

for game in "${retroarch_games[@]}"; do
    if [ "${name}" = "${game}" ]; then
	echo "Found retroarch lightgun game"

	lightgun=true
    fi
done

if $lightgun; then
    attempt=1
    while true; do
	echo "Starting lightgun attempt ${attempt}"
	$cmd &
	pid=$!

	# Give the process a moment to crash if it's going to
	sleep 1

	if kill -0 "$pid" 2>/dev/null; then
	    echo "Started lightgun successfully with PID $pid"
	    break
	else
	    if [ $attempt -lt 10 ]; then
		echo "Lightgun not found, retrying"
		attempt=$((attempt+1))
	    else
		echo "Could not start lightgun, exiting"
		exit 1
	    fi
	fi
    done

    # Detach from shell so it stays alive after script exits
    disown "$pid"
    echo "Backgrounded. Exiting script."
fi
