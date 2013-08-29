#!/bin/sh
#
# MPFR -- Multi-precision floating point
# http://www.mpfr.org/

DIRNAME=mpc-1.0.1
TARBALL=$DIRNAME.tar.gz
URL=http://www.multiprecision.org/mpc/download/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME
./configure --prefix=$PREFIX
make
make install
leave_stage
