#!/bin/sh
#
# Boost C++ libraries
# http://www.boost.org/

DIRNAME=boost_1_54_0
TARBALL=$DIRNAME.tar.bz2
URL=http://downloads.sourceforge.net/project/boost/boost/1.54.0/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xjf $TARBALL
cd $DIRNAME
./bootstrap.sh --prefix=$PREFIX
./b2 install
leave_stage
