#!/bin/sh
#
# OpenBLAS -- Successor to GotoBLAS
# http://xianyi.github.io/OpenBLAS/

if [ "$#" -ne 1 ]; then
  echo "Must include tag" >&2
  exit 1
fi

BUILD_TAG=$1
DIRNAME=OpenBLAS-$BUILD_TAG
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
