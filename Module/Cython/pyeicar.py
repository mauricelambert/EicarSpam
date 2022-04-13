import cython

# python setup.py build_ext --inplace

# >>> import pyeicar
# >>> pyeicar.eicar(10)

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