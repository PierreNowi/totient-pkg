#!/bin/sh
#
# Armadillo C++ matrix library
# http://arma.sourceforge.net/

module load openblas
module load lapack
module load suitesparse

source ./helper.sh
set_stage_dl http://downloads.sourceforge.net/project/arma/armadillo-5.200.2.tar.gz

# Build shared libraries
mkdir build
cd build
cmake \
  -D CMAKE_PREFIX_PATH=$PREFIX \
  -D CMAKE_INSTALL_PREFIX=$PREFIX \
  ..
make
make install

leave_stage
