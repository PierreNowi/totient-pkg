#!/bin/sh
#
# Armadillo C++ matrix library
# http://arma.sourceforge.net/

source $HOME/pkg/configs/helper.sh
set_stage_dl http://downloads.sourceforge.net/project/arma/armadillo-3.930.0.tar.gz

# Build shared libraries
mkdir build
cd build
cmake \
  -D CMAKE_PREFIX_PATH=$PREFIX \
  -D CMAKE_INSTALL_PREFIX=$PREFIX \
  ..
make
make install

leave_stage
