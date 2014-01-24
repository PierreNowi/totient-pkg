#!/bin/sh
#
# OpenMPI

source ./helper.sh
DIRNAME=openmpi-1.6.5
stage_dl_ac http://www.open-mpi.org/software/ompi/v1.6/downloads/$DIRNAME.tar.bz2 --prefix=$PREFIX/$DIRNAME
