#!/bin/sh
#
# LAPACK -- LAPACK library
# http://www.netlib.org/lapack/

DIRNAME=lapack-3.4.2
TARBALL=$DIRNAME.tgz
URL=http://www.netlib.org/lapack/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME

# Build shared libraries
mkdir build_shared
cd build_shared
cmake \
  -D CMAKE_INSTALL_PREFIX=$PREFIX /
  -D BUILD_SHARED_LIBS=ON \
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
  -D CMAKE_INSTALL_PREFIX=$PREFIX \
  -D USE_OPTIMIZED_BLAS=ON \
  -D LAPACKE=ON \
  ..
make
make install

leave_stage
