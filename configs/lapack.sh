#!/bin/sh
#
# LAPACK -- LAPACK library
# http://www.netlib.org/lapack/

source ./helper.sh
set_stage_dl http://www.netlib.org/lapack/lapack-3.5.0.tgz
export LD_LIBRARY_PATH=$PREFIX/OpenBLAS/lib:$LD_LIBRARY_PATH

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
