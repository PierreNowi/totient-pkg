#!/bin/sh
#
# GNU Linear Programming Kit

source ./helper.sh $*
stage_dl_ac http://ftp.gnu.org/gnu/glpk/glpk-4.55.tar.gz \
	--prefix=$PREFIX/utils
