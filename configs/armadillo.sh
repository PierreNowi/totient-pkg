#!/bin/sh
#
# Armadillo C++ matrix library
# http://arma.sourceforge.net/

source ./helper.sh $*

module load openblas/$TOOLCHAIN
module load lapack/3.5.0-$TOOLCHAIN
module load suitesparse/4.4.5-$TOOLCHAIN
BUILD_TAG=5.200.2-$TOOLCHAIN

set_stage_dl http://downloads.sourceforge.net/project/arma/armadillo-5.200.2.tar.gz

# Build shared libraries
mkdir build
cd build
cmake \
  -D CMAKE_PREFIX_PATH=$PREFIX/armadillo-$BUILD_TAG \
  -D CMAKE_INSTALL_PREFIX=$PREFIX/armadillo-BUILD_TAG \
  ..
make
make install

leave_stage
