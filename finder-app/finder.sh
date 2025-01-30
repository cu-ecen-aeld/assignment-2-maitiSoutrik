#!/bin/bash

# Check if both parameters are specified
if [ $# -ne 2 ]; then
    echo "Error: Two parameters required"
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir=$1
searchstr=$2

# Check if filesdir is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a directory"
    exit 1
fi

# Count the number of files and matching lines
numfiles=$(find "$filesdir" -type f | wc -l)
numlines=$(find "$filesdir" -type f -exec grep -c "$searchstr" {} \; | awk '{sum+=$1} END {print sum}')

echo "The number of files are $numfiles and the number of matching lines are $numlines"
exit 0