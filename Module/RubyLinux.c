#include "ruby.h"
#include <stdio.h>
#include "extconf.h"

VALUE rb_eicar(VALUE self, VALUE num) {
    FILE *file;
    char filename[12];

    int number = NUM2INT(num);

    for(int i = 0; i < number; i++) {
        snprintf(filename, 12, "test%d.txt", i);
        file = fopen(filename, "w");

        fprintf(
            file,
            "%sEICAR-STANDARD-ANTIVIRUS-TEST-FILE%s",
            "X5O!P%@AP[4\\PZX54(P^)7CC)7}$",
            "!$H+H*"
        );

        fclose(file);
    }

    return Qnil;
}

void Init_EicarSpam()
{
    VALUE mod = rb_define_module("Eicar");
    rb_define_method(mod, "eicar", rb_eicar, 1);
}