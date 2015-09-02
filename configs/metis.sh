#!/bin/sh
#
# Metis -- graph partitioning library
# http://glaros.dtc.umn.edu/gkhome/metis/metis/overview

source ./helper.sh
set_stage_dl http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/metis-5.1.0.tar.gz

make config prefix=$PREFIX/metis-5.1.0-gcc-4.9.2
make
make install

leave_stage
