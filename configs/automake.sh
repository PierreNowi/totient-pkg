#!/bin/sh
#
# Autoconf

DIRNAME=automake-1.14
TARBALL=$DIRNAME.tar.gz
URL=http://ftp.gnu.org/gnu/automake/$TARBALL

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
