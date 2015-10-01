#!/bin/sh
#
# UPC

source ./helper.sh $*

BUILD_TAG=2.20.2-$TOOLCHAIN
module load openmpi/1.10.0-$TOOLCHAIN

stage_dl_ac http://upc.lbl.gov/download/release/berkeley_upc-2.20.2.tar.gz \
  CC=gcc \
  CXX=g++ \
  MPI_CC=mpicc \
  -prefix=$PREFIX/upc-$BUILD_TAG \
  --disable-ibv
