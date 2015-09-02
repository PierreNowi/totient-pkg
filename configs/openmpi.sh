#!/bin/sh
#
# OpenMPI 1.10

BUILD_TAG=1.10.0-gcc-4.9.2
source ./helper.sh

stage_dl_ac \
http://www.open-mpi.org/software/ompi/v1.10/downloads/openmpi-1.10.0.tar.bz2 \
  --prefix=$PREFIX/openmpi-1.10.0-gcc-4.9.2
