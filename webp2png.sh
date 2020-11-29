#!/bin/bash

# directory containing images
input_dir="$1"

if [[ -z "$input_dir" ]]; then
    echo "Please specify an input directory."
    exit 1
fi

# for each webp in the input directory
for img in $( find $input_dir -type f -iname "*.webp" );
do
    dwebp $img -o ${img%.*}.png
done
