#!/bin/sh
#
# GCC

DIRNAME=cloog-0.18.1
TARBALL=$DIRNAME.tar.gz
URL=http://www.bastoul.net/cloog/pages/download/count.php3?url=./$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME
export LIBRARY_PATH=$PREFIX/lib
export LD_LIBRARY_PATH=$PREFIX/lib
./configure --prefix=$PREFIX
make
make install
leave_stage
