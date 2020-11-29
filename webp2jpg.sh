#!/bin/bash

# directory containing images
input_dir="$1"

# jpg image quality
quality="$2"

if [[ -z "$input_dir" ]]; then
    echo "Please specify an input directory."
    exit 1
elif [[ -z "$quality" ]]; then
    echo "Please specify image quality."
    exit 1
fi

# for each webp in the input directory
for img in $( find $input_dir -type f -iname "*.webp" );
do
    # convert to png first
    dwebp $img -o ${img%.*}.png

    # then convert png to jpg
    convert ${img%.*}.png -quality $quality% ${img%.*}.jpg
done
