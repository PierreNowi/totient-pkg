#!/bin/sh
#
# Tau

source ./helper.sh $*
set_stage_dl http://www.cs.uoregon.edu/research/paracomp/tau/tauprofile/dist/tau_latest.tar.gz

if echo $TOOLCHAIN | grep "icc" ; then
   CONFIG_FLAGS="-c++=icpc -cc=icc -fortran=intel"
else
   module load openmpi/1.10.0-$TOOLCHAIN
   CONFIG_FLAGS="-c++=g++ -cc=gcc -fortran=gnu"
fi

# NB: Telling the config scripts where DynInst is has proven
#     very difficult -- giving up for the moment.

module load pdt/3.20-$TOOLCHAIN
./configure -prefix=$PREFIX/tau-$TOOLCHAIN \
	$CONFIG_FLAGS \
	-pdt=$PREFIX/pdt-3.20-$TOOLCHAIN -papi=$PREFIX/utils \
	-mpi -openmp -pthread
make install

leave_stage
