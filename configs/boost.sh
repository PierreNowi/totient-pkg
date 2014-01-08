#!/bin/sh
#
# Boost C++ libraries
# http://www.boost.org/

source $HOME/pkg/configs/helper.sh
set_stage_dl http://downloads.sourceforge.net/project/boost/boost/1.54.0/boost_1_54_0.tar.bz2

./bootstrap.sh --prefix=$PREFIX
./b2 install

leave_stage
