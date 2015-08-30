#!/bin/sh
#
# Set up wrappers around gcc/g++/gfortran

VER=5.2.0
source ./helper.sh
set_stage

mkdir -p $PREFIX/gcc-$VER/wrapper
rm -f $PREFIX/gcc-$VER/wrapper/*

WRAPS="c++ cpp g++ gcc gccgo gcov gcov-tool gfortran go gofmt gcc-ar gcc-nm gcc-ranlib"

echo "Start $WRAPS"
for f in $WRAPS ; do
  ln -s $PREFIX/gcc-$VER/bin/$f-$VER $PREFIX/gcc-$VER/wrapper/$f
done

# for f in $WRAPS2 ; do
#   ln -s $PREFIX/gcc-$VER/bin/gcc-$f-$VER $PREFIX/gcc-$VER/wrapper/$f
# done

leave_stage
