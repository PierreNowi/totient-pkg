#!/bin/sh
#
# PDT

source ./helper.sh $*
set_stage_dl http://tau.oregon.edu/pdt.tgz

module load openmpi-1.8.6
./configure -prefix=$PREFIX/pdt -GNU
make install -j

leave_stage
