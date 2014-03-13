#!/bin/sh
#
# mpiP

source ./helper.sh

stage_dl_ac \
  http://downloads.sourceforge.net/project/mpip/mpiP/mpiP-3.4/mpiP-3.4.tar.gz \
  --prefix=$PREFIX/mpip
