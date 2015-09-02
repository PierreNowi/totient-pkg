#!/bin/sh
#
# hwloc

source ./helper.sh $*
set_stage

wgetl http://www.ezix.org/software/files/lshw-B.02.17.tar.gz
tar -xzf lshw-B.02.17.tar.gz
cd lshw-B.02.17

mkdir -p $PREFIX/lshw
make PREFIX=$PREFIX/lshw
make install PREFIX=$PREFIX/lshw

leave_stage
