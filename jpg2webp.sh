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

# for each webp in the input directory
for img in $( find $input_dir -type f -iname "*.jpg" -o -iname "*.jpeg" );
do
    # convert to png first
    convert $img ${img%.*}.png

    # then convert png to webp
    cwebp ${img%.*}.png -q $quality -o ${img%.*}.webp
done
