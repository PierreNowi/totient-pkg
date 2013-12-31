#!/bin/sh
#
# SLEPc

DIRNAME=slepc-3.4.3
TARBALL=$DIRNAME.tar.gz
#URL=http://www.grycap.upv.es/slepc/download/download.php?filename=$TARBALL
URL=http://www.grycap.upv.es/slepc/download/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME
export SLEPC_DIR=$PWD
module load petsc
./configure --prefix=$PREFIX/$DIRNAME
make SLEPC_DIR=$PWD PETSC_DIR=$PETSC_DIR PETSC_ARCH=arch-installed-petsc 
make SLEPC_DIR=$PWD PETSC_DIR=$PETSC_DIR PETSC_ARCH=arch-installed-petsc install
leave_stage
