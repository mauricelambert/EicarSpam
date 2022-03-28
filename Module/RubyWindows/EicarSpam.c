#include "cfunc.h"
#include <stdio.h>

#include "ruby.h"
#include "extconf.h"

VALUE rb_eicar(VALUE self, VALUE num) {
    FILE *file;
    char filename[12];

    int number = NUM2INT(num);
    printf("%d", number);

    for(int i = 0; i < number; i++) {
        snprintf(filename, 12, "test%d.txt", i);
        file = fopen(filename, "w");

        if(file == NULL) {
            printf("file \"test%d.txt\" can't be opened\n", i);
            return Qnil;
        }

        fprintf(
            file,
            "%sEICAR-STANDARD-ANTIVIRUS-TEST-FILE%s",
            "X5O!P%@AP[4\\PZX54(P^)7CC)7}$",
            "!$H+H*"
        );

        cfclose(file);
    }

    return Qnil;
}

void Init_EicarSpam()
{
    VALUE mod = rb_define_module("Eicar");
    rb_define_method(mod, "eicar", rb_eicar, 1);
}
