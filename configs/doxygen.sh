#!/bin/sh
#
# Doxygen - C++ documentation tool
# http://www.stack.nl/~dimitri/doxygen/download.html

DIRNAME=doxygen-1.8.4
TARBALL=$DIRNAME.src.tar.gz
URL=http://ftp.stack.nl/pub/users/dimitri/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME
./configure --prefix $PREFIX 
make
make install
leave_stage
