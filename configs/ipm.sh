#!/bin/sh
#
# IPM
# http://ipm-hpc.org

source ./helper.sh
set_stage_dl https://github.com/nerscadmin/IPM.git
module load openmpi-1.8.6

patch -p0 < $MAGMA_PKG/patches/ipm.patch
set +e
libtoolize
aclocal
automake --add-missing
autoreconf
set -e

./configure --prefix=$PREFIX/IPM
make install

leave_stage
