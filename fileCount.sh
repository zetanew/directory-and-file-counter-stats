#!/bin/bash

dir_path=$(pwd)

# Check if an argument is provided, use it as the directory path if so
if [ ! -z "$1" ]; then
    dir_path=$1
fi

# Check if the directory path is valid
if [ ! -d "$dir_path" ]; then
    echo "Invalid directory path: $dir_path"
    exit 1
fi

file_count=0
dir_count=0

# Loop through the files and directories in the specified directory
for item in "$dir_path"/*; do
    if [ -f "$item" ]; then
        ((file_count++))
    elif [ -d "$item" ]; then
        ((dir_count++))
    fi
done

# Display the results
echo "Number of files: $file_count"
echo "Number of directories: $dir_count"
echo "Total count: $((file_count + dir_count))"