#!/bin/sh
#
# OpenBLAS -- Successor to GotoBLAS
# http://xianyi.github.io/OpenBLAS/

DIRNAME=OpenBLAS
URL=git://github.com/xianyi/OpenBLAS

source $HOME/pkg/configs/helper.sh
set_stage
git clone $URL
cd OpenBLAS
#make
make TARGET=NEHALEM
make install PREFIX=$PREFIX/$DIRNAME
ln -s $PREFIX/$DIRNAME/lib/libopenblas.a  $PREFIX/$DIRNAME/lib/libblas.a
ln -s $PREFIX/$DIRNAME/lib/libopenblas.so $PREFIX/$DIRNAME/lib/libblas.so
leave_stage
