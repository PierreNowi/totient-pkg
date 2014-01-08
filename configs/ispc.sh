#!/bin/bash
#
# Intel SPMD Program Compiler (ISPC)

source $HOME/pkg/configs/helper.sh
set_stage

git clone https://github.com/ispc/ispc.git ispc
cd ispc

module load llvm-svn
make
cp ispc $PREFIX/llvm/bin

leave_stage
