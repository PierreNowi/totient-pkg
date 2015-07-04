#!/bin/sh
#
# DynInst

source ./helper.sh
set_stage_dl http://www.dyninst.org/sites/default/files/downloads/dyninst/8.2.1/DyninstAPI-8.2.1.tgz

./configure -prefix=$PREFIX
make install

leave_stage
