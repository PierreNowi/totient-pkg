#!/bin/sh
#
# SPRNG -- Scalable Pseudo-Random Number Generator
# http://www.sprng.org/
#
# TODO: Update to sprng5

DIRNAME=sprng4.4
TARBALL=$DIRNAME.bz2
URL=http://www.sprng.org/Version4.0/sprng4.4.bz2

source ./helper.sh $*
set_stage
wgetl $URL
tar -xjf $TARBALL
cd $DIRNAME

# Corrections -- wrong mpi.h + wrong Fortran wrapper for gfortran
sed -i 's/mpi[/]mpi.h/mpi.h/' SRC/communicate.cpp
sed -i 's/__/_/' SRC/fwrap.h

module load openmpi-1.8.6
./configure CXX=mpicxx F77=mpif77 CXXFLAGS=-DLONG64=long LIBS=-lmpi_cxx \
--prefix=$PREFIX/$DIRNAME
make clean
make
make install

leave_stage
