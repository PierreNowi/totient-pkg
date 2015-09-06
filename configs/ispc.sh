#!/bin/bash
#
# Intel SPMD Program Compiler (ISPC)

source ./helper.sh $*
set_stage

wget http://sourceforge.net/projects/ispcmirror/files/v1.8.2/ispc-v1.8.2knl-linux.tar.gz/download
tar -xzf download
module load llvm/3.7.0
cd ispc-v1.8.2knl-linux
install -t `llvm-config --bindir` ispc

leave_stage
