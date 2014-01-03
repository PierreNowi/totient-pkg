#!/bin/sh
#
# HDF5 storage system
# http://www.hdfgroup.org/HDF5/

DIRNAME=netcdf-4.3.0
TARBALL=$DIRNAME.tar.gz
URL=ftp://ftp.unidata.ucar.edu/pub/netcdf/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME
./configure --prefix=$PREFIX/netcdf --enable-shared
#make
#make install
leave_stage
