#!/bin/sh
#
# Tau

source ./helper.sh $*
set_stage_dl http://www.cs.uoregon.edu/research/paracomp/tau/tauprofile/dist/tau_latest.tar.gz

if echo $TOOLCHAIN | grep "icc" ; then
   CONFIG_FLAGS="-c++=icpc -cc=icc -fortran=intel"
else
   CONFIG_FLAGS="-c++=g++ -cc=gcc -fortran=gnu"
fi

module load pdt/3.20-$TOOLCHAIN
module load openmpi/1.10.0-$TOOLCHAIN
OMPI=$PREFIX/openmpi-1.10.0-$TOOLCHAIN/
./configure -prefix=$PREFIX/tau-$TOOLCHAIN \
	$CONFIG_FLAGS \
	-pdt=$PREFIX/pdt-3.20-$TOOLCHAIN -papi=$PREFIX/utils \
	-dyninst=/opt/rh/devtoolset-3/root/usr/lib64/dyninst/ \
	-mpi -mpiinc=$OMPI/include -mpilib=$OMPI/lib \
	-openmp -pthread
make install

leave_stage
