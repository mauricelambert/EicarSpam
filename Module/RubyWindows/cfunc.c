#include <stdio.h>
#include "cfunc.h"

int myclose(FILE * file) {
	return fclose(file);
}
