#!/bin/sh
#
# DynInst

source ./helper.sh $*

module load libelf/0.163
module load boost/1.59.0-$TOOLCHAIN

VER=9.0.3
stage_dl_cmake \
    http://www.paradyn.org/release$VER/DyninstAPI-$VER.tgz \
    -DBoost_INCLUDE_DIR=$PREFIX/boost-1.59.0-$TOOLCHAIN/include/ \
    -DCMAKE_INSTALL_PREFIX=$PREFIX/dyninst-$VER-$TOOLCHAIN 

