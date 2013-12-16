#!/bin/sh
#
# Tau

DIRNAME=tau-2.23
TARBALL=tau.tgz
URL=http://tau.uoregon.edu/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME
./configure -prefix=$PREFIX/tau -c++=g++ -cc=gcc -fortran=gnu \
	-pdt=$PREFIX/pdt -papi=$PREFIX \
	-mpi -mpiinc=/usr/include/openmpi-x86_64/ \
        -mpilib=/usr/lib64/openmpi/ \
	-openmp -pthread
make install
leave_stage
