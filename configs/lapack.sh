#!/bin/sh
#
# LAPACK -- LAPACK library
# http://www.netlib.org/lapack/

source ./helper.sh
set_stage_dl httpp://www.netlib.org/lapack/lapack-3.5.0.tgz

# Build shared libraries
mkdir build_shared
cd build_shared
cmake \
  -D CMAKE_INSTALL_PREFIX=$PREFIX/$DIRNAME \
  -D USE_OPTIMIZED_BLAS=ON \
  -D LAPACKE=ON \
  ..
make
make install
cd ..

# Build static libraries
mkdir build_static
cd build_static
cmake \
  -D CMAKE_INSTALL_PREFIX=$PREFIX/$DIRNAME \
  -D BUILD_SHARED_LIBS=ON \
  -D USE_OPTIMIZED_BLAS=ON \
  -D LAPACKE=ON \
  ..
make
make install

leave_stage
