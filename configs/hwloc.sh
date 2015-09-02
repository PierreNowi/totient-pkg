#!/bin/sh
#
# hwloc

source ./helper.sh $*
DIRNAME=utils
stage_dl_ac http://www.open-mpi.org/software/hwloc/v1.11/downloads/hwloc-1.11.0.tar.bz2 --prefix=$PREFIX/$DIRNAME
