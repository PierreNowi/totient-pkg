#!/bin/sh
#
# Eigen -- C++ template library for linear algebra
# http://eigen.tuxfamily.org/

DIRNAME=eigen-3.2.0
TARBALL=$DIRNAME.tar.bz2
URL=http://www.netlib.org/lapack/$TARBALL
URL=http://bitbucket.org/eigen/eigen/get/3.2.0.tar.bz2

source $HOME/pkg/configs/helper.sh
set_stage
if [ ! -f $HOME/pkg/archives/$TARBALL ] ; then
  wget $URL
  mv 3.2.0.tar.bz2 $HOME/pkg/archives/$TARBALL
fi
cp $HOME/pkg/archives/$TARBALL .
tar -xjf $TARBALL
cd eigen-eigen-ffa86ffb5570

# Build shared libraries
mkdir build
cd build
cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
  -D FFTW_LIBRARIES="-lfftw3" ..
make
make install

leave_stage
