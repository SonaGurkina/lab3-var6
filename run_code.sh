#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <file.c>"
    exit 1
fi
file="$1"
if [ ! -f "$file" ]; then
    echo "Error: File '$file' does not exist."
    exit 1
fi

output="${file%.*}"  # Имя файла без расширения
gcc "$file" -o "$output" -std=c11 -Wall -Wextra

if [ $? -ne 0 ]; then
    echo "Compilation failed."
    exit 1
fi

echo "Running $output..."
./"$output"
