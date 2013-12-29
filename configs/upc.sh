#!/bin/sh
#
# UPC

DIRNAME=berkeley_upc-2.18.0
TARBALL=$DIRNAME.tar.gz
URL=http://upc.lbl.gov/download/release/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME
./configure \
	CC=gcc \
	CXX=g++ \
	MPI_CC=mpicc \
	-prefix=$PREFIX/upc \
	--disable-ibv
make install
leave_stage
