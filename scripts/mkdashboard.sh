# This requires you have jq and imagemagick installed
# OS X homebrew: brew install jq imagemagick
# Usage: resizeall.sh input.png fallout4 001 center/east/west/etc..

mkdir dashboard 2> /dev/null

convert $1 -resize 875x -gravity $4 -crop 875x493+0+0 dashboard/${2}.875x439.${3}.jpg
convert $1 -resize x258 -gravity $4 -crop 320x258+0+0 dashboard/${2}.320x258.${3}.jpg
convert $1 -resize 435x -gravity $4 -crop 435x493+0+0 dashboard/${2}.435x493.${3}.jpg
convert $1 -resize 435x -gravity $4 -crop 435x244+0+0 dashboard/${2}.435x244.${3}.jpg

json_out=" [ { \"slideShow\": { \"full\": \"${2}.875x493.${3}.jpg\", \"mobile\": \"${2}.320x258.${3}.jpg\" }, \"rightFeature\": { \"full\": \"${2}.435x244.${3}.jpg\", \"mobile\": \"${2}.320x258.${3}.jpg\" } }, [ { \"full\": \"${2}.435x493.${3}.jpg\", \"mobile\": \"${2}.320x258.${3}.jpg\" }, { \"full\": \"${2}.435x493.${3}.jpg\", \"mobile\": \"${2}.320x258.${3}.jpg\" }, { \"full\": \"${2}.435x493.${3}.jpg\", \"mobile\": \"${2}.320x258.${3}.jpg\" } ], [ { \"full\": \"${2}.435x244.${3}.jpg\", \"mobile\": \"${2}.320x258.${3}.jpg\" }, { \"full\": \"${2}.435x244.${3}.jpg\", \"mobile\": \"${2}.320x258.${3}.jpg\" }, { \"full\": \"${2}.435x244.${3}.jpg\", \"mobile\": \"${2}.320x258.${3}.jpg\" } ] ] "

echo $json_out | jq .
echo $json_out > ${2}.${3}.dashboard-images.json
