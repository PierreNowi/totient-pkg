#!/bin/sh
#
# cURL
# http://curl.haxx.se

DIRNAME=curl-7.32.0
TARBALL=$DIRNAME.tar.bz2
URL=http://curl.haxx.se/download/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xjf $TARBALL
cd $DIRNAME
./configure --prefix=$PREFIX
make
make install
leave_stage
