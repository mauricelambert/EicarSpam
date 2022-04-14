# EicarSpam Module

Cross-platform modules to test your antivirus software with multiple Eicar files, and different ways to use it.

 - Sources are available on my [Github](https://github.com/mauricelambert/EicarSpam/tree/main/Module)
 - Binary files are available in [Github releases](https://github.com/mauricelambert/EicarSpam/releases/latest/) and [SourceForge files](https://sourceforge.net/projects/eicarspam/files/Modules/)

1) Go
2) Python
3) Cython (python syntax)
4) Cython
5) Ruby

## Go

```go
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
//             printf("file can't be opened\n");
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
```

## Python

```c
#include <Python.h>

static PyObject *method_eicar(PyObject *self, PyObject *args) {
    int x = NULL;

    if(!PyArg_ParseTuple(args, "i", &x)) {
        return NULL;
    }

    FILE *file;
    char filename[12];
 
    for(int i = 0; i < x; i++) {
        snprintf(filename, 12, "test%d.txt", i);
        file = fopen(filename, "w");
     
        if(file == NULL) {
            printf("file \"test%d.txt\" can't be opened\n", i);
            Py_RETURN_NONE;
        }
 
        fprintf(
            file,
            "%sEICAR-STANDARD-ANTIVIRUS-TEST-FILE%s",
            "X5O!P%@AP[4\\PZX54(P^)7CC)7}$",
            "!$H+H*"
        );

        fclose(file);
    }

    Py_RETURN_NONE;
}

static PyMethodDef EicarMethods[] = {
    {"eicar", method_eicar, METH_VARARGS, "Generate eicar test files."},
    {NULL, NULL, 0, NULL}
};

static struct PyModuleDef eicarspammodule = {
    PyModuleDef_HEAD_INIT,
    "EicarSpam",
    "Generate eicar test files.",
    -1,
    EicarMethods
};

PyMODINIT_FUNC PyInit_EicarSpam(void) {
    PyObject *module = PyModule_Create(&eicarspammodule);
    return module;
}
```

```python
from setuptools import setup, Extension

def main():
    setup(
        name="EicarSpam",
        version="1.0.0",
        description="Generate eicar test files.",
        author="Maurice Lambert",
        author_email="mauricelambert434@gmail.com",
        ext_modules=[Extension("EicarSpam", ["CPython.c"])],
    )

if __name__ == "__main__":
    main()
```

```bash
python3 setup.py build_ext --inplace
```

## Cython

```python
from setuptools import setup
from Cython.Build import cythonize

setup(
    ext_modules=cythonize(
        [
             'pyeicar.py',
            'cyeicar.pyx',
        ],
        annotate=True,
    ),
)
```

```bash
python setup.py build_ext --inplace
```

### Cython (python syntax)

```
import cython

def eicar(number: cython.int) -> None:

    """
    This function writes <number> eicar file.
    """

    data = b"%(start)s%(text)s%(end)s" % {
        b"end": b"!$H+H*",
        b"start": b"X5O!P%@AP[4\\PZX54(P^)7CC)7}$",
        b"text": b"EICAR-STANDARD-ANTIVIRUS-TEST-FILE",
    }

    while number > 0:
        number -= 1

        with open(f"test{number}.txt", "wb") as file:
            file.write(data)

    return None
```

### Cython (cython syntax)

```cython
def eicar(int number):
    cdef char data[68]

    data = b"%(start)s%(text)s!$H+H*" % {
        b"text": b"EICAR-STANDARD-ANTIVIRUS-TEST-FILE",
        b"start": b"X5O!P%@AP[4\\PZX54(P^)7CC)7}$",
    }

    for i in range(number):
        file = open(f"test{i}.txt", 'wb')
        file.write(data)
        file.close()

    return None
```

## Ruby

```c
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
```