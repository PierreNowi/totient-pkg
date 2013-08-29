#!/bin/sh
#
# GCC

DIRNAME=gcc-4.8.1
TARBALL=$DIRNAME.tar.bz2
URL=http://gcc.parentingamerica.com/releases/$DIRNAME/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xjf $TARBALL
cd $DIRNAME
export LIBRARY_PATH=`echo $LIBRARY_PATH | sed 's/:$//'`
./configure --prefix=$PREFIX --disable-multilib --program-suffix=-4.8
make
make install
leave_stage
