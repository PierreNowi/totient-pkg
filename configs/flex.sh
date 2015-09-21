#!/bin/sh
#
# Flex

source ./helper.sh $*
stage_dl_ac http://iweb.dl.sourceforge.net/project/flex/flex-2.5.39.tar.xz \
	--prefix=$PREFIX/utils
