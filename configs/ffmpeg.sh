#!/bin/sh
#
# LLVM

source ./helper.sh $*
set_stage

git clone --depth 1 git://source.ffmpeg.org/ffmpeg.git ffmpeg
cd ffmpeg
./configure --prefix=$PREFIX/utils --extra-libs="-ldl" \
	--enable-gpl --enable-nonfree --enable-libx264
make
make install

leave_stage
