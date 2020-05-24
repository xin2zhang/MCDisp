import setuptools
from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext
from Cython.Build import cythonize
import numpy
from os import system
npy_include_dir = numpy.get_include()

# compile fortran code
make_comp = 'make -C pydisp/surfmodes'
print(make_comp)
system(make_comp)

ext_modules = [Extension("pydisp", ["pydisp/pydisp.pyx",],
                         include_dirs = [npy_include_dir],
                         libraries=["gfortran", "surfmodes"],
                         extra_link_args=["-Lpydisp/surfmodes/"])]

with open("README.rst", "r") as f:
    long_description = f.read()

setuptools.setup(
    name="MCDisp",
    version="0.0.1",
    author="",
    author_email="",
    description="Dispersion curve iversion using Monte Carlo sampling",
    long_description=long_description,
    long_description_content_type="text/markdown",
    packages=setuptools.find_packages(),
    ext_modules=cythonize(ext_modules),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: GNU License"
    ],
    python_requires='>=3.6',
)
