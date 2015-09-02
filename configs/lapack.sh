#!/bin/sh
#
# LAPACK -- LAPACK library
# http://www.netlib.org/lapack/

BUILD_TAG=3.5.0-gcc-4.9.2
source ./helper.sh
set_stage_dl http://www.netlib.org/lapack/lapack-3.5.0.tgz

# Build shared libraries
mkdir build_shared
cd build_shared
cmake \
  -D CMAKE_INSTALL_PREFIX=$PREFIX/$DIRNAME-gcc-4.9.2 \
  -D LAPACKE=ON \
  ..
make
make install
cd ..

# Build static libraries
mkdir build_static
cd build_static
cmake \
  -D CMAKE_INSTALL_PREFIX=$PREFIX/$DIRNAME-gcc-4.9.2 \
  -D BUILD_SHARED_LIBS=ON \
  -D LAPACKE=ON \
  ..
make
make install

leave_stage
