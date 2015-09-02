#!/bin/sh
#
# OpenMPI 1.10

source ./helper.sh $*
BUILD_TAG=1.10.0-$TOOLCHAIN

stage_dl_ac \
http://www.open-mpi.org/software/ompi/v1.10/downloads/openmpi-1.10.0.tar.bz2 \
  --prefix=$PREFIX/openmpi-$BUILD_TAG
