#!/bin/bash
#
# Intel SPMD Program Compiler (ISPC)

source ./helper.sh
set_stage

git clone https://github.com/ispc/ispc.git ispc
cd ispc

module load llvm
make
install -t `llvm-config --bindir` ispc

leave_stage
