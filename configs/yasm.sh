#!/bin/sh
#
# Yasm -- Yet Another Assembler

source ./helper.sh $*
stage_dl_ac http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz \
	--prefix=$PREFIX/utils
