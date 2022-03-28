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
