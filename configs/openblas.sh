#!/bin/sh
#
# OpenBLAS -- Successor to GotoBLAS
# http://xianyi.github.io/OpenBLAS/

DIRNAME=OpenBLAS-gcc-4.9.2
URL=git://github.com/xianyi/OpenBLAS

source ./helper.sh
set_stage
git clone $URL
cd OpenBLAS
make
make install PREFIX=$PREFIX/$DIRNAME
rm -f $PREFIX/$DIRNAME/lib/libblas.a
rm -f $PREFIX/$DIRNAME/lib/libblas.so
ln -s $PREFIX/$DIRNAME/lib/libopenblas.a  $PREFIX/$DIRNAME/lib/libblas.a
ln -s $PREFIX/$DIRNAME/lib/libopenblas.so $PREFIX/$DIRNAME/lib/libblas.so
leave_stage
