#!/bin/bash

check() {
    local array=("$@")
    local elements=()

    for element in "${array[@]}"; do
        if [[ " ${elements[*]} " =~ " $element " ]]; then
            echo "В массиве есть дубликаты."
            return
        else
            elements+=("$element")
        fi
    done

    echo "Все элементы массива уникальны."
}

read -p "Введите элементы массива через пробел: " -a array

if [ "${#array[@]}" -eq 0 ]; then
    echo "Вы не ввели элементы массива."
    exit 1
fi

check "${array[@]}"
