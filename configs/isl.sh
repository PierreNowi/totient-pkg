#!/bin/sh
#
# GCC

DIRNAME=isl-0.11.1
TARBALL=$DIRNAME.tar.bz2
URL=ftp://gcc.gnu.org/pub/gcc/infrastructure/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xjf $TARBALL
cd $DIRNAME
export LIBRARY_PATH=$PREFIX/lib
export LD_LIBRARY_PATH=$PREFIX/lib
./configure --prefix=$PREFIX
make
make install
leave_stage
