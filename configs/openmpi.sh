#!/bin/sh
#
# OpenMPI

source ./helper.sh
DIRNAME=openmpi-1.8.6
stage_dl_ac http://www.open-mpi.org/software/ompi/v1.8/downloads/$DIRNAME.tar.bz2 --prefix=$PREFIX/$DIRNAME
