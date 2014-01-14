#!/bin/sh
#
# PDT

source ./helper.sh
set_stage_dl http://tau.oregon.edu/pdt.tgz

./configure -prefix=$PREFIX/pdt -GNU
make install -j

leave_stage
