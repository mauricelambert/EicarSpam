#include<stdio.h>

// Linux:
// __attribute__((visibility("default"))) int eicar(int x) {
__declspec( dllexport ) int eicar(int x) {
    FILE *file;
    char filename[12];

    for(int i = 0; i < x; i++) {
        snprintf(filename, 12, "test%d.txt", i);
        file = fopen(filename, "w");

        if(file == NULL) {
            printf("file \"test%d.txt\" can't be opened\n", i);
            return 1;
        }

        fprintf(
            file,
            "%sEICAR-STANDARD-ANTIVIRUS-TEST-FILE%s",
            "X5O!P%@AP[4\\PZX54(P^)7CC)7}$",
            "!$H+H*"
        );

        fclose(file);
    }

    return 0;
}