#!/bin/sh
#
# SLEPc

source ./helper.sh
set_stage_dl http://slepc.upv.es/download/download.php?filename=slepc-3.6.0.tar.gz

export SLEPC_DIR=$PWD
module load petsc
./configure --prefix=$PREFIX/$DIRNAME
make SLEPC_DIR=$PWD PETSC_DIR=$PETSC_DIR 
make SLEPC_DIR=$PWD PETSC_DIR=$PETSC_DIR install

leave_stage
