#!/bin/sh
#
# Boehm Garbage Colelctor
# http://www.hboehm.info/gc/

source ./helper.sh $*
stage_dl_ac http://www.hboehm.info/gc/gc_source/gc-7.4.2.tar.gz \
	--prefix=$PREFIX/utils
