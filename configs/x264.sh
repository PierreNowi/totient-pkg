#!/bin/sh
#
# H.264 video encoder

source ./helper.sh $*
set_stage

git clone --depth 1 git://git.videolan.org/x264
cd x264
./configure --prefix=$PREFIX/utils --enable-static
make
make install
make distclean

leave_stage
