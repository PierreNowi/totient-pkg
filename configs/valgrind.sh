#!/bin/sh
#
# Valgrind -- memory debugger and instrumentation
# http://valgrind.org/

DIRNAME=valgrind-3.9.0
TARBALL=$DIRNAME.tar.bz2
URL=http://valgrind.org/downloads/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xjf $TARBALL
cd $DIRNAME
./configure --prefix=$PREFIX
make
make install
leave_stage
