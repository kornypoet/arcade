#!/bin/bash

wine_games=(
    'CrossyRoad.exe'
    'pacmanbr.zip'
    )

name="${1##*/}"
conf_dir='/home/travis/arcade/keyd'

for game in "${wine_games[@]}"; do
    if [ "${name}" = "${game}" ]; then
	echo "Remapping ${game} using keyd"
	
	ln -sf "${conf_dir}/${game%.*}.conf" "${conf_dir}/default.conf"
	sudo systemctl start keyd
    fi
done
