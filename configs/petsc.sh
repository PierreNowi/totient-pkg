#!/bin/sh
#
# PETSc

DIRNAME=petsc-3.4.3

source ./helper.sh
set_stage_dl http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-lite-3.4.3.tar.gz

./configure \
	--with-mpi-dir=/share/cs-instructional/cs5220/local/openmpi-1.6.5/ \
	--with-shared-libraries \
	--prefix=$PREFIX/$DIRNAME
make all test install

leave_stage
