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