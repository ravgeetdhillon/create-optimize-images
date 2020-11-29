#!/bin/bash

input_dirs="$1"
output_dir="$2"

if [[ -z "$input_dirs" ]]; then
    echo "Please specify an input directories."
    exit 1
elif [[ -z "$output_dir" ]]; then
    echo "Please specify an output directory."
    exit 1
fi

# create a directory to store the generated images
mkdir -p $output_dir

# split input directories string into an array
input_dirs=(${input_dirs//,/ })

# for each directory in input directory
for dir in "${input_dirs[@]}"
do
    # copy images into generated images directory
    rsync -a $dir/* $output_dir/
done
