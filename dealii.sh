#!/bin/sh
#
# deal.II
# http://www.dealii.org/

DIRNAME=deal.II-8.0.0
TARBALL=$DIRNAME.tar.gz
URL=https://dealii.googlecode.com/files/deal.II-8.0.0.tar.gz

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME

# Build shared libraries
mkdir build_shared
cd build_shared

cmake \
  -D CMAKE_INSTALL_PREFIX:PATH=$PREFIX/deal.II-8.0-serial \
  -D DEAL_II_WITH_TRILINOS:BOOL=ON \
  -D TRILINOS_DIR=$PREFIX/trilinos/serial-opt-shared \
  ..

make
make install
leave_stage
