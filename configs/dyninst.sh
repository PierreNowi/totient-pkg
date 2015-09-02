#!/bin/sh
#
# DynInst

source ./helper.sh $*
stage_dl_cmake http://www.dyninst.org/sites/default/files/downloads/dyninst/8.2.1/DyninstAPI-8.2.1.tgz \
    -DBoost_INCLUDE_DIR=$PREFIX/include/

