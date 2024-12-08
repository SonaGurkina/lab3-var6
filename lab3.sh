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

if [ "$#" -eq 0 ]; then
    echo "Использование: $0 элемент1 элемент2 элемент3 ..."
    exit 1
fi

check "$@"
