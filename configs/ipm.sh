#!/bin/sh
#
# IPM
# http://ipm-hpc.org
#
# Note: Have to go through src/GEN.wrapper_mpi.c and kill refs to opal_config.h

source ./helper.sh
set_stage_dl https://github.com/nerscadmin/IPM.git
module load openmpi-1.8.6

patch -p0 < $TOTIENT_PKG/patches/ipm.patch
set +e
libtoolize
aclocal
automake --add-missing
autoreconf
set -e

./configure --prefix=$PREFIX/IPM
make install

leave_stage
