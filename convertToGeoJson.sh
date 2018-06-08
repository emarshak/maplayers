#!/bin/bash
if [ "$1" == "" ]; then
    echo "usage: $0 <gpx files>"
    exit 1
fi
if [ "$(which togeojson)" == "" ]; then
    echo "togeojson not detected"
    exit 2
fi
for file in $@; do
    echo processing $file
    fileNoExt=${file%.*}
    fileAsGeoJson=$fileNoExt.json
    togeojson $file > $fileAsGeoJson
done
echo complete
