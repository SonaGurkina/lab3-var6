#!/bin/bash

c_file="program.c"

if [ ! -f "$c_file" ]; then
    echo "Файл $c_file не найден."
    exit 1
fi

output_file="program"


gcc "$c_file" -o "$output_file"

if [ $? -eq 0 ]; then
    ./"$output_file"
else
    echo "Ошибка компиляции."
    exit 1
fi
