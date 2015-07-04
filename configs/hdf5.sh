#!/bin/bash
#
# HDF5 storage system
# http://www.hdfgroup.org/HDF5/

source ./helper.sh
# stage_dl_ac ftp://ftp.hdfgroup.uiuc.edu/pub/outgoing/hdf5/snapshots/v19/hdf5-1.9.169.tar.bz2 --enable-cxx --enable-fortran
stage_dl_ac http://www.hdfgroup.org/ftp/HDF5/current/src/hdf5-1.8.15-patch1.tar.bz2 --enable-cxx --enable-fortran
