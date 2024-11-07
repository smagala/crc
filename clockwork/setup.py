import glob
from setuptools import setup, find_packages


setup(
    name="clockwork",
    version="0.12.5",
    description="Pipeline code for CRyPTIC project",
    packages=find_packages(),
    author="Martin Hunt",
    author_email="mhunt@ebi.ac.uk",
    url="https://github.com/iqbal-lab-org/clockwork",
    scripts=glob.glob("scripts/*"),
    install_requires=[
        "pyfastaq >= 3.14.0",
        "pysam >= 0.11.2.1",
    ],
    license="MIT",
    classifiers=[
        "Development Status :: 4 - Beta",
        "Topic :: Scientific/Engineering :: Bio-Informatics",
        "Programming Language :: Python :: 3 :: Only",
        "License :: OSI Approved :: MIT License",
    ],
)
