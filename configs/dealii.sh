#!/bin/sh
#
# deal.II
# http://www.dealii.org/

module load openblas
module load lapack
module load suitesparse
module load trilinos-serial

source ./helper.sh
set_stage_dl https://github.com/dealii/dealii/releases/download/v8.2.1/dealii-8.2.1.tar.gz

# Build shared libraries
mkdir build_shared
cd build_shared

cmake \
  -D CMAKE_INSTALL_PREFIX:PATH=$PREFIX/deal.II-8.2.1-serial \
  -D DEAL_II_WITH_TRILINOS:BOOL=ON \
  -D TRILINOS_DIR=$PREFIX/trilinos/serial-opt-shared \
  ..

make
make install
leave_stage
