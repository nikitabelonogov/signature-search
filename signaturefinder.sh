#!/bin/bash
sourcefilepath=$1
offset=${2:-0}
size=${3:-16}
root=${4:-.}
signature=$(tail -c +$offset $sourcefilepath | head -c $size)
for file in $(find -f $root 2>/dev/null); do
    currentsignature=$(tail -c +$offset $file 2>/dev/null | head -c $size 2>/dev/null)
    if [[ $signature == $currentsignature ]]; then 
        echo $file;
    fi
done
