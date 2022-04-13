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