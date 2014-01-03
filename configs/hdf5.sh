#!/bin/sh
#
# HDF5 storage system
# http://www.hdfgroup.org/HDF5/

DIRNAME=hdf5-1.9.169
TARBALL=$DIRNAME.tar.bz2
URL=ftp://ftp.hdfgroup.uiuc.edu/pub/outgoing/hdf5/snapshots/v19/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xjf $TARBALL
cd $DIRNAME
mkdir build
cd build
CC=/usr/lib64/openmpi/bin/mpicc \
../configure --prefix=$PREFIX/hdf5p --enable-parallel
make
make install
leave_stage
