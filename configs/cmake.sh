#!/bin/sh
#
# CMake
# http://www.cmake.org/

source $HOME/pkg/configs/helper.sh
set_stage_dl http://www.cmake.org/files/v2.8/cmake-2.8.12.1.tar.gz
./bootstrap --prefix=$PREFIX
make
make install
leave_stage 
