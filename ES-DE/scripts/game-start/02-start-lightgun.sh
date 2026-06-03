#!/bin/bash

joystick_single_games=(
    'area51.zip'
    'bbh.zip'
    'bbhsc.zip'
    'bbh2sp.zip'
    'bbhcotw.zip'
    'hotd.zip'
    'jpark.zip'
    'lethalen.zip'
    'le2.zip'
    'maxforce.zip'
    'opwolf.zip'
    'policetr.zip'
    'ptblank.zip'
    'ptblank2.zip'
    'timecris.zip'
)

joystick_auto_games=(
    'alien3.zip'
    'term2.zip'
)

mouse_single_games=(
    "Duck\ Hunt\ \(World\).nes"
    "Hogan\'s\ Alley\ \(World\).nes"
    "hotd2.zip"
)

cmd="mono /home/travis/Sinden/LightgunMono.exe"
cfg="/home/travis/Sinden/LightgunMono.exe.config"
single_cfg="/home/travis/Sinden/single.config"
auto_cfg="/home/travis/Sinden/auto.config"

name="${1##*/}"
lightgun=false

echo "Checking if ${name} requires lightgun"

for game in "${joystick_single_games[@]}"; do
    if [ "${name}" = "${game}" ]; then
	echo "Found joystick single shot lightgun game"

	ln -sf $single_cfg $cfg
	cmd="${cmd} joystick"
	lightgun=true
    fi
done

for game in "${joystick_auto_games[@]}"; do
    if [ "${name}" = "${game}" ]; then
	echo "Found joystick automatic lightgun game"

	ln -sf $auto_cfg $cfg	
	cmd="${cmd} joystick"
	lightgun=true
    fi
done

for game in "${mouse_single_games[@]}"; do
    if [ "${name}" = "${game}" ]; then
	echo "Found mouse single shot lightgun game"

	ln -sf $single_cfg $cfg	
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
