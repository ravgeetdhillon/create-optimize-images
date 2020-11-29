#!/bin/bash

input_dir="$1"

if [[ -z "$input_dir" ]]; then
    echo "Please specify an input directory."
    exit 1
fi

for img in $( find $input_dir -type f -iname "*" );
do
    # get the type of the image
    img_type=$(basename `file --mime-type -b $img`)

    # create a directory for the image type
    mkdir -p $img_type

    # move the images into their type directory
    rsync -a $img $img_type
done
