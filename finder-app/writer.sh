#!/bin/sh
# Script to write content to a file, creating the directory path if it doesn't exist

# Check if both arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Invalid number of arguments"
    echo "Usage: $0 <full-path-to-file> <string-to-write>"
    exit 1
fi

writefile="$1"
writestr="$2"

# Check if either argument is empty
if [ -z "$writefile" ] || [ -z "$writestr" ]; then
    echo "Error: Both arguments must be specified"
    exit 1
fi

# Create the directory path if it doesn't exist
dir_path=$(dirname "$writefile")
mkdir -p "$dir_path" 2>/dev/null

# Attempt to write the string to the file
if ! echo "$writestr" > "$writefile"; then
    echo "Error: Could not create file $writefile"
    exit 1
fi
