#!/bin/sh
#
# GCC

VER=gcc-5.2.0
source ./helper.sh

# -- Set up paths
export LIBRARY_PATH=$PREFIX/$VER/lib:$PREFIX/$VER/lib64
export LD_RUN_PATH=$PREFIX/$VER/lib:$PREFIX/$VER/lib64
export CPATH=$PREFIX/$VER/lib:$PREFIX/$VER/include

set_stage

#
# See: https://gcc.gnu.org/wiki/InstallingGCC
#
wgetl http://gcc.parentingamerica.com/releases/$VER/$VER.tar.bz2
tar -xjf $VER.tar.bz2
cd $VER
./contrib/download_prerequisites
cd ..
mkdir objdir
cd objdir
$PWD/../$VER/configure --prefix=$PREFIX/$VER \
                       --enable-languages=c,c++,fortran,go \
                       --disable-multilib \
                       --program-suffix=-5.2.0
make
mkdir -p $PREFIX/$VER
make install

leave_stage
