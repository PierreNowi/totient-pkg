#!/bin/sh
#
# Intel SPMD Program Compiler (ISPC)


source $HOME/pkg/configs/helper.sh
set_stage

git clone https://github.com/ispc/ispc.git ispc
cd ispc

make
cp ispc $PREFIX/bin

leave_stage
