#!/bin/sh
#
# IPM
# http://ipm-hpc.org
#
# Note: Have to go through src/GEN.wrapper_mpi.c and kill refs to opal_config.h

source ./helper.sh $*
set_stage_dl https://github.com/nerscadmin/IPM.git

if echo $TOOLCHAIN | grep "icc" ; then
  export COMPILER=INTEL
else
  export COMPILER=GNU
  module load openmpi/1.10.0-$TOOLCHAIN
fi
echo "Compiler: $COMPILER"

patch -p0 < $TOTIENT_PKG/patches/ipm.patch
set +e
libtoolize
aclocal
automake --add-missing
autoreconf
set -e

./configure \
  --with-compiler=$COMPILER \
  --with-cpu=CORE2DUO \
  --prefix=$PREFIX/IPM-$TOOLCHAIN
make install

leave_stage
