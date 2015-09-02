#!/bin/sh
#
# Boost C++ libraries
# http://www.boost.org/

source ./helper.sh $*

BUILD_TAG=1.59.0-$TOOLCHAIN
module load anaconda

set_stage_dl http://downloads.sourceforge.net/project/boost/boost/1.59.0/boost_1_59_0.tar.bz2

./bootstrap.sh --prefix=$PREFIX/boost-$BUILD_TAG
./b2 install

leave_stage
