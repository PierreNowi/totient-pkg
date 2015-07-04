#!/bin/sh
#
# Boost C++ libraries
# http://www.boost.org/

source ./helper.sh
set_stage_dl http://downloads.sourceforge.net/project/boost/boost/1.58.0/boost_1_58_0.tar.bz2

./bootstrap.sh --prefix=$PREFIX
./b2 install

leave_stage
