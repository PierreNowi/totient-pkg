#!/bin/sh
#
# UPC

source ./helper.sh
stage_dl_ac http://upc.lbl.gov/download/release/berkeley_upc-2.18.0.tar.gz \
  CC=gcc \
  CXX=g++ \
  MPI_CC=mpicc \
  -prefix=$PREFIX/upc \
  --disable-ibv
