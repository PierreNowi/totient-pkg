#!/bin/sh
#
# Tau

source ./helper.sh
set_stage_dl http://tau.oregon.edu/tau.tgz

module load openmpi-1.8.6
OMPI=$PREFIX/openmpi-1.8.6/
./configure -prefix=$PREFIX/tau -c++=g++ -cc=gcc -fortran=gnu \
	-pdt=$PREFIX/pdt -papi=$PREFIX -dyninst=$PREFIX \
	-mpi -mpiinc=$OMPI/include -mpilib=$OMPI/lib \
	-openmp -pthread
make install

leave_stage
