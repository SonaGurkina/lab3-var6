#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "Необходимо передать аргументы"
    exit 1
fi

array=("$@")
size=${#array[@]}

for i in $(seq 0 $((size - 1))); do
    for j in $(seq $((i + 1)) $((size - 1))); do
        if [ "${array[i]}" == "${array[j]}" ]; then
            echo "В массиве есть дубликаты."
            exit 0
        fi
    done
done

echo "Все элементы массива уникальны."
