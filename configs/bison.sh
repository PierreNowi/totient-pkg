#!/bin/sh
#
# Bison

source ./helper.sh $*
stage_dl_ac http://ftp.gnu.org/gnu/bison/bison-3.0.tar.xz \
	--prefix=$PREFIX/utils
