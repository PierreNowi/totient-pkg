#!/bin/sh
#
# Zlib (www.zlib.net)

source ./helper.sh $*
stage_dl_ac http://tukaani.org/xz/xz-5.2.1.tar.gz \
	--prefix=$PREFIX/utils
