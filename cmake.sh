#!/bin/sh
#
# CMake
# http://www.cmake.org/

DIRNAME=cmake-2.8.11.2
TARBALL=$DIRNAME.tar.gz
URL=http://www.cmake.org/files/v2.8/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage 
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME
./configure --prefix=$PREFIX
make
make install
leave_stage 
