#!/bin/sh
#
# Eigen -- C++ template library for linear algebra
# http://eigen.tuxfamily.org/

module load openblas/gcc-4.9.2
module load lapack/3.5.0-gcc-4.9.2
module load suitesparse/4.4.5-gcc-4.9.2

source ./helper.sh
set_stage_dl http://bitbucket.org/eigen/eigen/get/3.2.5.tar.bz2

# Build shared libraries
mkdir build
cd build
cmake -D CMAKE_INSTALL_PREFIX=$PREFIX/eigen-3.2.5-gcc-4.9.2 \
  -D FFTW_LIBRARIES="-lfftw3" ..
make
make install

leave_stage
