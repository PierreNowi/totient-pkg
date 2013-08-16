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
make
make install PREFIX=$PREFIX
cp $PREFIX/lib/libopenblas.a  $PREFIX/lib/libblas.a
cp $PREFIX/lib/libopenblas.so $PREFIX/lib/libblas.so
leave_stage
