#!/bin/sh
#
# PETSc

DIRNAME=petsc-3.4.3
TARBALL=petsc-lite-3.4.3.tar.gz
URL=http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME
./configure \
	--with-mpi-dir=/usr/lib64/openmpi/ \
	--prefix=$PREFIX/$DIRNAME
make all test install
leave_stage
