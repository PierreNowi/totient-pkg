#!/bin/sh
#
# CMake
# http://www.cmake.org/

source ./helper.sh $*
set_stage_dl http://www.cmake.org/files/v3.3/cmake-3.3.1.tar.gz
./bootstrap --prefix=$PREFIX/utils
make
make install
leave_stage
