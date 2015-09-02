#!/bin/sh
#
# OpenMPI 1.10

if [ "$#" -ne 1 ]; then
  echo "Must include tag" >&2
  exit 1
fi

BUILD_TAG=1.10.0-$1
source ./helper.sh

stage_dl_ac \
http://www.open-mpi.org/software/ompi/v1.10/downloads/openmpi-1.10.0.tar.bz2 \
  --prefix=$PREFIX/openmpi-1.10.0-$1
