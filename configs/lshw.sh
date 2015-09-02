#!/bin/sh
#
# hwloc

source ./helper.sh $*
set_stage

wgetl http://www.ezix.org/software/files/lshw-B.02.17.tar.gz
tar -xzf lshw-B.02.17.tar.gz
cd lshw-B.02.17

mkdir -p $PREFIX/utils
make PREFIX=$PREFIX/utils
make install PREFIX=$PREFIX/utils

leave_stage
