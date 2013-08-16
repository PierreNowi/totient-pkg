#!/bin/sh
#
# livevent -- an event notification library
# http://libevent.org/

DIRNAME=libevent-2.0.21-stable
TARBALL=$DIRNAME.tar.gz
URL=https://github.com/downloads/libevent/libevent/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME
./configure --prefix=$PREFIX 
make
make install
leave_stage
