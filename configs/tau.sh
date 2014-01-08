#!/bin/sh
#
# Tau

source $HOME/pkg/configs/helper.sh
set_stage_dl http://tau.oregon.edu/tau.tgz

OMPI=/share/cs-instructional/cs5220/local/openmpi-1.6.5/
./configure -prefix=$PREFIX/tau -c++=g++ -cc=gcc -fortran=gnu \
	-pdt=$PREFIX/pdt -papi=$PREFIX -dyninst=$PREFIX \
	-mpi -mpiinc=$OMPI/include -mpilib=$OMPI/lib \
	-openmp -pthread
make install

leave_stage
