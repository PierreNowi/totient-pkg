#!/bin/sh
#
# PDT

source ./helper.sh $*
set_stage_dl http://www.cs.uoregon.edu/research/paracomp/pdtoolkit/Download/pdt-3.20.tar.gz

if echo $TOOLCHAIN | grep "icc" ; then
  CONFIG_FLAGS="--icpc"
fi

module load openmpi/1.10.0-$TOOLCHAIN
./configure -prefix=$PREFIX/pdt-3.20-$TOOLCHAIN $CONFIG_FLAGS
make install 

leave_stage
