#!/bin/bash

# directory containing images
input_dir="$1"

# webp image quality
quality="$2"

if [[ -z "$input_dir" ]]; then
    echo "Please specify an input directory."
    exit 1
elif [[ -z "$quality" ]]; then
    echo "Please specify image quality."
    exit 1
fi

# for each png in the input directory
for img in $( find $input_dir -type f -iname "*.png" );
do
    cwebp $img -q $quality -o ${img%.*}.webp
done
