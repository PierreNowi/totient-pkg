#!/bin/sh
#
# GNU dbm (Database Manater)

source ./helper.sh $*
stage_dl_ac ftp://ftp.gnu.org/gnu/gdbm/gdbm-1.11.tar.gz \
	--prefix=$PREFIX/utils
