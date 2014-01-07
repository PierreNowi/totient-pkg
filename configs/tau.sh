#!/bin/sh
#
# Tau

DIRNAME=tau-2.23
TARBALL=tau.tgz
URL=http://tau.uoregon.edu/$TARBALL
OMPI=/share/cs-instructional/cs5220/local/openmpi-1.6.5/

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME
./configure -prefix=$PREFIX/tau -c++=g++ -cc=gcc -fortran=gnu \
	-pdt=$PREFIX/pdt -papi=$PREFIX -dyninst=$PREFIX \
	-mpi -mpiinc=$OMPI/include -mpilib=$OMPI/lib \
	-openmp -pthread
make install
leave_stage
