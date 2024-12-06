#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <locale.h>
#include <stdbool.h>

bool searchDublicate(char* arr[], int n) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = i + 1; j < n; j++) {
            if (strcmp(arr[j], arr[i]) == 0) return false;
        }
    }
    return true;
}

int main() {
    setlocale(LC_ALL, "");

    int n;
    printf("Введите количество элементов (не больше 100): ");
    if (scanf("%d", &n) != 1) {
        printf("Ошибка ввода. Ожидалось число.\n");
        return 1;
    }

    if (n <= 0) {
        printf("Количество элементов должно быть больше нуля.\n");
        return 1;
    } else if (n > 100) {
        printf("Количество элементов не может быть больше 100.\n");
        return 1;
    }

    // Выделяем память для массива строк
    char** arr = (char**)malloc(n * sizeof(char*));
    if (!arr) {
        printf("Ошибка выделения памяти.\n");
        return 1;
    }

    printf("Введите элементы:\n");
    for (int i = 0; i < n; i++) {
        arr[i] = (char*)malloc(256 * sizeof(char));
        if (!arr[i]) {
            printf("Ошибка выделения памяти.\n");
            for (int j = 0; j < i; j++) free(arr[j]);
            free(arr);
            return 1;
        }
        scanf("%255s", arr[i]);
    }

    if (searchDublicate(arr, n)) {
        printf("Все элементы уникальны.\n");
    } else {
        printf("Обнаружены дубликаты.\n");
    }

    // Освобождаем память
    for (int i = 0; i < n; i++) {
        free(arr[i]);
    }
    free(arr);

    return 0;
}
