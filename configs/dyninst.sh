#!/bin/sh
#
# DynInst

source $HOME/pkg/configs/helper.sh
set_stage_dl http://www.dyninst.org/sites/default/files/downloads/dyninst/8.1.2/DyninstAPI-8.1.2.tgz

./configure -prefix=$PREFIX
make install

leave_stage
