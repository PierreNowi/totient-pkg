#!/bin/sh
#
# GCC

DIRNAME=gcc-4.8.2
TARBALL=$DIRNAME.tar.bz2
URL=http://gcc.parentingamerica.com/releases/$DIRNAME/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xjf $TARBALL
cd $DIRNAME
export LIBRARY_PATH=$PREFIX/lib
export LD_LIBRARY_PATH=$PREFIX/lib
./configure --prefix=$PREFIX/$DIRNAME --disable-multilib --with-cloog
make
make install
leave_stage
