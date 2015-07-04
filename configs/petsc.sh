#!/bin/sh
#
# PETSc

DIRNAME=petsc-3.6.0

source ./helper.sh
set_stage_dl http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-lite-3.6.0.tar.gz

./configure \
	--with-mpi-dir=$PREFIX/openmpi-1.8.6/ \
	--with-shared-libraries \
	--prefix=$PREFIX/$DIRNAME
make all test install

leave_stage
