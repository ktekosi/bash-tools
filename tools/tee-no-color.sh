#!/bin/bash

# Check if any arguments are provided
if [ $# -eq 0 ]; then
    echo "Usage: color_script | $0 [TEE_OPTIONS] FILENAME"
    exit 1
fi

# Extract the last argument as the filename
filename=${@: -1}

# Remove the last argument (filename) from the list of arguments
unset 'args[@]: -1'

# Use tee to output to both stdout and to sed, which removes color codes
# Pass all arguments except the last one (filename) to tee
tee "${@:1:$#-1}" >(sed 's/\x1b\[[0-9;]*m//g' > "$filename")
