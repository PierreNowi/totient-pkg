#!/bin/sh
#
# Doxygen - C++ documentation tool
# http://www.stack.nl/~dimitri/doxygen/download.html

source ./helper.sh
set_stage_dl http://ftp.stack.nl/pub/users/dimitri/doxygen-1.8.10.src.tar.gz

mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX
make install

leave_stage

