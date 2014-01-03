#!/bin/sh
#
# SLEPc

DIRNAME=openmpi-1.6.5
TARBALL=$DIRNAME.tar.bz2
URL=http://www.open-mpi.org/software/ompi/v1.6/downloads/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xjf $TARBALL
cd $DIRNAME
./configure --prefix=$PREFIX/$DIRNAME
make
make install
leave_stage
