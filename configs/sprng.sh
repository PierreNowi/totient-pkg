#!/bin/sh
#
# SPRNG -- Scalable Pseudo-Random Number Generator
# http://www.sprng.org/

DIRNAME=sprng4.4
TARBALL=$DIRNAME.bz2
URL=http://www.sprng.org/Version4.0/sprng4.4.bz2

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xjf $TARBALL
cd $DIRNAME

# Corrections -- wrong mpi.h + wrong Fortran wrapper for gfortran
sed -i 's/mpi[/]mpi.h/mpi.h/' SRC/communicate.cpp
sed -i 's/__/_/' SRC/fwrap.h

./configure CXX=mpicxx F77=mpif77 CXXFLAGS=-DLONG64=long LIBS=-lmpi_cxx \
--prefix=$PREFIX/$DIRNAME
make clean
make
make install

leave_stage
