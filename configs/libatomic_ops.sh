#!/bin/sh
#
# libatomic_ops (needed for Boehm GC)
# http://www.hboehm.info/gc/

source ./helper.sh $*
stage_dl_ac http://www.ivmaisoft.com/_bin/atomic_ops/libatomic_ops-7.4.2.tar.gz \
	--prefix=$PREFIX/utils
