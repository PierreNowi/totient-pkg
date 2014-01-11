#!/bin/sh
#
# OpenMPI

source $HOME/pkg/configs/helper.sh
stage_dl_ac http://www.open-mpi.org/software/ompi/v1.6/downloads/openmpi-1.6.5.tar.bz2 --prefix=$PREFIX/$DIRNAME
