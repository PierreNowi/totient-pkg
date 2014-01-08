#!/bin/sh
#
# PDT

source $HOME/pkg/configs/helper.sh
set_stage_dl http://tau.oregon.edu/pdt.tgz

./configure -prefix=$PREFIX/pdt -GNU
make install -j

leave_stage
