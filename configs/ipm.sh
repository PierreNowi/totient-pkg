#!/bin/sh
#
# IPM
# http://ipm-hpc.org

URL=https://github.com/nerscadmin/IPM.git

source $HOME/pkg/configs/helper.sh
set_stage
git clone $URL
cd IPM
patch -p0 < $HOME/pkg/patches/ipm.patch
libtoolize
aclocal
automake --add-missing
autoreconf
./configure --prefix=$PREFIX/IPM
make install
leave_stage
