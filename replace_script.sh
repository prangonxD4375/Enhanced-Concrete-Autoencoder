#!/bin/bash

# Define the target file path
target_file="C:/Python311/Lib/site-packages/concrete_autoencoder/__init__.py"

# Get the directory of the script
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if the target file exists
if [ -e "$target_file" ]; then
    # Replace the target file with the one in the script's directory
    cp "$script_dir/__init__.py" "$target_file"
    echo "Replaced $target_file with the __init__.py from the script's directory."
else
    echo "Target file $target_file not found. Make sure it exists."
fi
