#!/bin/sh
#
# Autoconf

DIRNAME=autoconf-2.69
TARBALL=$DIRNAME.tar.gz
URL=http://ftp.gnu.org/gnu/autoconf/$TARBALL

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
