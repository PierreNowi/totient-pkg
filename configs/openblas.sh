#!/bin/sh
#
# OpenBLAS -- Successor to GotoBLAS
# http://xianyi.github.io/OpenBLAS/

source ./helper.sh $*

DIRNAME=OpenBLAS-$BUILD_TAG
URL=git://github.com/xianyi/OpenBLAS

set_stage
git clone $URL
cd OpenBLAS
make TARGET=HASWELL
make install TARGET=HASWELL PREFIX=$PREFIX/$DIRNAME
rm -f $PREFIX/$DIRNAME/lib/libblas.a
rm -f $PREFIX/$DIRNAME/lib/libblas.so
ln -s $PREFIX/$DIRNAME/lib/libopenblas.a  $PREFIX/$DIRNAME/lib/libblas.a
ln -s $PREFIX/$DIRNAME/lib/libopenblas.so $PREFIX/$DIRNAME/lib/libblas.so
leave_stage
