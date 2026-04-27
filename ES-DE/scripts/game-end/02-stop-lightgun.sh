#!/bin/bash

if [ -z "$(ps aux | grep '[m]ono')" ]; then
    echo "No lightgun process found"
else
    echo "Found lightgun process, killing"
    killall mono
fi

