#!/bin/sh
#
# Zlib (www.zlib.net)

source ./helper.sh $*
stage_dl_cmake http://zlib.net/zlib-1.2.8.tar.gz \
	-DCMAKE_INSTALL_PREFIX=$PREFIX
