#!/bin/sh
#
# SLEPc

source $HOME/pkg/configs/helper.sh
set_stage_dl http://www.grycap.upv.es/slepc/download/slepc-3.4.3.tar.gz

export SLEPC_DIR=$PWD
module load petsc
./configure --prefix=$PREFIX/$DIRNAME
make SLEPC_DIR=$PWD PETSC_DIR=$PETSC_DIR PETSC_ARCH=arch-installed-petsc 
make SLEPC_DIR=$PWD PETSC_DIR=$PETSC_DIR PETSC_ARCH=arch-installed-petsc install

leave_stage
