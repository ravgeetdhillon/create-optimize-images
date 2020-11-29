#!/bin/bash

# directory containing images
input_dir="$1"

if [[ -z "$input_dir" ]]; then
    echo "Please specify an input directory."
    exit 1
fi

# for each svg in the input directory
for img in $( find $input_dir -type f -iname "*.svg" );
do
    svgo $img -o ${img%.*}-optimized.svg
done
