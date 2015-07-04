#!/bin/sh
#
# CMake
# http://www.cmake.org/

source ./helper.sh
set_stage_dl http://www.cmake.org/files/v3.2/cmake-3.2.3.tar.gz
./bootstrap --prefix=$PREFIX
make
make install
leave_stage 
