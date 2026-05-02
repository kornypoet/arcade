#!/bin/bash

wine_games=(
    'CrossyRoad.exe'
    'pacmanbr'
    )

name="${1##*/}"

for game in "${wine_games[@]}"; do
    if [ "${name}" = "${game}" ]; then
	echo "Remapping ${game} using keyd"
	sudo systemctl start keyd
    fi
done
