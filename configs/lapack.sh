#!/bin/sh
#
# LAPACK -- LAPACK library
# http://www.netlib.org/lapack/

if [ "$#" -ne 1 ] || ! [ -d "$1" ]; then
  echo "Usage: $0 DIRECTORY" >&2
  exit 1
fi

BUILD_TAG=3.5.0-$1
source ./helper.sh
set_stage_dl http://www.netlib.org/lapack/lapack-3.5.0.tgz

# Build shared libraries
mkdir build_shared
cd build_shared
cmake \
  -D CMAKE_INSTALL_PREFIX=$PREFIX/$DIRNAME-$1 \
  -D LAPACKE=ON \
  ..
make
make install
cd ..

# Build static libraries
mkdir build_static
cd build_static
cmake \
  -D CMAKE_INSTALL_PREFIX=$PREFIX/$DIRNAME-$1 \
  -D BUILD_SHARED_LIBS=ON \
  -D LAPACKE=ON \
  ..
make
make install

leave_stage
