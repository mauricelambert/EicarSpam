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
