#include <stdio.h>
#define cfclose(f) myclose(f)
#define cfclose_ptr cfclose_ptr

int myclose(FILE *file);

// int (*cfclose_ptr)(FILE *) = &fclose;
// (*cfclose_ptr)(file);