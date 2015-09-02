#!/bin/sh
#
# cURL
# http://expat.sourceforge.net/

source ./helper.sh $*
stage_dl_ac http://downloads.sourceforge.net/expat/expat-2.1.0.tar.gz \
	--prefix=$PREFIX/utils
