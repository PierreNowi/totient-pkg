#!/bin/sh
#
# Boost C++ libraries
# http://www.boost.org/

if [ "$#" -ne 1 ]; then
  echo "Requires compiler tag" >&2
  exit 1
fi

BUILD_TAG=1.59.0-$1
source ./helper.sh
module load anaconda

set_stage_dl http://downloads.sourceforge.net/project/boost/boost/1.59.0/boost_1_59_0.tar.bz2

./bootstrap.sh --prefix=$PREFIX/boost-$BUILD_TAG
./b2 install

leave_stage
