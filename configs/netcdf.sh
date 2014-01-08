#!/bin/bash
#
# NetCDF library
# http://www.unidata.ucar.edu/software/netcdf/

source $HOME/pkg/configs/helper.sh
LDFLAGS=-L$PREFIX/lib \
CPPFLAGS=-I$PREFIX/include \
stage_dl_ac ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.3.0.tar.gz 

