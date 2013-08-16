#!/bin/sh
#
# MPFR -- Multi-precision floating point
# http://www.mpfr.org/

DIRNAME=mpfr-3.1.2
TARBALL=$DIRNAME.tar.bz2
URL=http://www.mpfr.org/mpfr-current/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xjf $TARBALL
cd $DIRNAME
./configure --prefix=$PREFIX
make
make install
leave_stage
