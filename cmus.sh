#!/bin/bash

prepend_zero () {
        seq -f "%02g" $1 $1
}

crstatus=$(cmus-remote -C status)

artist=$(echo -n $(echo "$crstatus" | grep "tag artist" | cut -c 12-))

# Check for albumartist if artist is missing
if [[ -z "$artist" ]]; then
    artist=$(echo -n $(echo "$crstatus" | grep "tag albumartist" | cut -c 17-))
fi

if [[ $artist = *[!\ ]* ]]; then
    playing=$(echo "$crstatus" | grep status | cut -c 8-)
    case "$playing" in
        (playing) icon=;;
        (paused) icon=;;
        (*) icon=;;
    esac
    song=$(echo -n $(echo "$crstatus" | grep title | cut -c 11-))
    position=$(echo "$crstatus" | grep position | cut -c 10-)
    minutes1=$(prepend_zero $(($position / 60)))
    seconds1=$(prepend_zero $(($position % 60)))
    duration=$(echo "$crstatus" | grep duration | cut -c 10-)
    minutes2=$(prepend_zero $(($duration / 60)))
    seconds2=$(prepend_zero $(($duration % 60)))
    echo -n "$icon [$minutes1:$seconds1 / $minutes2:$seconds2] $artist - $song"
else
    echo
fi

