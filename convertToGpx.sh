#!/bin/bash
if [ "$1" == "" ]; then
    echo "usage: $0 <json files>"
    exit 1
fi
if [ "$(which togpx)" == "" ]; then
    echo "togpx not detected"
    exit 2
fi
for file in $@; do
    echo processing $file
    fileNoExt=${file%.*}
    fileAsGpx=$fileNoExt.gpx
    togpx $file > $fileAsGpx
done
echo complete
