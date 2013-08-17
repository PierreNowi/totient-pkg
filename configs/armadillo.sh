#!/bin/sh
#
# Armadillo C++ matrix library
# http://arma.sourceforge.net/

DIRNAME=armadillo-3.910.0
TARBALL=$DIRNAME.tar.gz
URL=http://downloads.sourceforge.net/project/arma/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME

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
