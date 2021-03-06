#!/bin/bash
#
# NetCDF library
# http://www.unidata.ucar.edu/software/netcdf/

source ./helper.sh $*

module load hdf5/1.8.13-$TOOLCHAIN
BUILD_TAG=4.3.3.1-$TOOLCHAIN

stage_dl_ac ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.3.3.1.tar.gz \
  --prefix=$PREFIX/netcdf-$BUILD_TAG
