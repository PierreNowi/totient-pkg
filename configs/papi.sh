#!/bin/sh
#
# PAPI

source ./helper.sh
set_stage_dl http://icl.cs.utk.edu/projects/papi/downloads/papi-5.2.0.tar.gz
cd src
./configure --prefix $PREFIX
make
make install
leave_stage

