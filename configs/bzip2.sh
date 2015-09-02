#!/bin/sh
#
# Autoconf

source ./helper.sh
set_stage_dl http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz 

make PREFIX=$PREFIX/utils
make install PREFIX=$PREFIX/utils

leave_stage
