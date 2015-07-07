#!/bin/bash
#
# HDF5 storage system
# http://www.hdfgroup.org/HDF5/

source ./helper.sh
stage_dl_ac https://www.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8.13/src/hdf5-1.8.13.tar.bz2 --enable-cxx --enable-fortran
