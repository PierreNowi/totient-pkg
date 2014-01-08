#!/bin/sh
#
# IPM
# http://ipm-hpc.org

source $HOME/pkg/configs/helper.sh
set_stage_dl https://github.com/nerscadmin/IPM.git

patch -p0 < $HOME/pkg/patches/ipm.patch
libtoolize
aclocal
automake --add-missing
autoreconf
./configure --prefix=$PREFIX/IPM
make install

leave_stage
