#!/bin/sh
#
# MatIO

source ./helper.sh $*

module load hdf5/1.8.13-$TOOLCHAIN
BUILD_TAG=1.5.2-$TOOLCHAIN

SF=http://downloads.sourceforge.net/project
stage_dl_ac $SF/matio/matio/1.5.2/matio-1.5.2.tar.gz \
  --with-zlib=$PREFIX \
  --with-hdf5=$PREFIX \
  --prefix=$PREFIX/matio-$BUILD_TAG
