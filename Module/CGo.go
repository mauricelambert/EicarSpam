package main

// #include<stdio.h>
//  
// static void eicar(int x) {
//     FILE *file;
//     char filename[12];
//  
//     for(int i = 0; i < x; i++) {
//         snprintf(filename, 12, "test%d.txt", i);
//         file = fopen(filename, "w");
//      
//         if(file == NULL) {
//             printf("file \"test%d.txt\" can't be opened\n", i);
//             return;
//         }
//  
//         fprintf(
//             file,
//             "%sEICAR-STANDARD-ANTIVIRUS-TEST-FILE%s",
//             "X5O!P%@AP[4\\PZX54(P^)7CC)7}$",
//             "!$H+H*"
//         );
//
//         fclose(file);
//     }
// } // no blank line after this line !
import "C"

func main() {
    C.eicar(C.int(300))
}
