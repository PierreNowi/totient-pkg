#!/bin/sh
#
# Trilinos
# http://trilinos.sandia.gov/

DIRNAME=trilinos-11.4.1-Source
TARBALL=$DIRNAME.tar.bz
URL=http://trilinos.sandia.gov/download/files/

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME

# Build shared libraries
mkdir build_shared
cd build_shared

cmake \
  -D CMAKE_INSTALL_PREFIX:PATH=$PREFIX/trilinos/serial-opt-shared \
  -D BUILD_SHARED_LIBS:BOOL=ON \
  -D TPL_ENABLE_MPI:BOOL=OFF \
  -D CMAKE_Fortran_FLAGS:STRING="-O5" \
  -D MEMORYCHECK_COMMAND:FILEPATH=$PREFIX/bin/valgrind \
  -D DART_TESTING_TIMEOUT:STRING=600 \
  -D CMAKE_VERBOSE_MAKEFILE:BOOL=TRUE \
  -D Trilinos_ENABLE_ALL_PACKAGES:BOOL=ON \
  -D Trilinos_ENABLE_EXPLICIT_INSTANTIATION:BOOL=ON \
  -D TPL_ENABLE_Boost:BOOL=ON \
  ..

make
make install
leave_stage
