#!/bin/sh
#
# SZip

source ./helper.sh $*

BUILD_TAG=1.8.13-$TOOLCHAIN
stage_dl_ac http://www.hdfgroup.org/ftp/lib-external/szip/2.1/src/szip-2.1.tar.gz \
	--prefix=$PREFIX/hdf5-$BUILD_TAG
