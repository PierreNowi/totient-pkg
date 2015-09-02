#!/bin/sh
#
# cURL
# http://curl.haxx.se

source ./helper.sh $*
stage_dl_ac http://curl.haxx.se/download/curl-7.44.0.tar.bz2 \
	--prefix=$PREFIX/utils
