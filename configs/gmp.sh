#!/bin/sh
#
# GMP -- GNU Multiprecision Library
# http://gmplib.org/

DIRNAME=gmp-5.1.3
TARBALL=$DIRNAME.tar.bz2
URL=ftp://ftp.gnu.org/gnu/gmp/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xjf $TARBALL
cd $DIRNAME
./configure --prefix=$PREFIX --enable-cxx
make
make install
leave_stage
