#!/bin/sh
#
# Trilinos
# http://trilinos.sandia.gov/

source ./helper.sh
set_stage_dl http://trilinos.csbsju.edu/download/files/trilinos-12.0.1-Source.tar.bz2

# Build shared libraries
mkdir build_shared
cd build_shared

cmake \
  -D CMAKE_INSTALL_PREFIX:PATH=$PREFIX/trilinos/serial-opt-shared \
  -D BUILD_SHARED_LIBS:BOOL=ON \
  -D TPL_ENABLE_MPI:BOOL=OFF \
  -D BLAS_LIBRARY_DIRS=$PREFIX/OpenBLAS \
  -D CMAKE_Fortran_FLAGS:STRING="-O5" \
  -D MEMORYCHECK_COMMAND:FILEPATH=$PREFIX/bin/valgrind \
  -D DART_TESTING_TIMEOUT:STRING=600 \
  -D CMAKE_VERBOSE_MAKEFILE:BOOL=TRUE \
  -D Trilinos_ENABLE_ALL_PACKAGES:BOOL=ON \
  -D Trilinos_ENABLE_EXPLICIT_INSTANTIATION:BOOL=ON \
  -D TPL_ENABLE_Boost:BOOL=ON \
  -D Trilinos_EXTRA_LINK_FLAGS:STRING=-lgfortran \
  ..

make
make install

leave_stage
