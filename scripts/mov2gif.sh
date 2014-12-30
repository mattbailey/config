#!/usr/bin/env bash

# Requires:
#  - gifsicle
#  - ffpmeg
#  - xquartz (in OSX)

input=$1
name=$(basename ${input} | sed 's/\....$//')

ffmpeg -i $input -s 1200x800 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > ${name}.gif
