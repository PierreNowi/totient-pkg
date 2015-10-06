#!/bin/sh
#
# MAQAO - Modular Assembly Quality Analyzer and Optimizer
# http://maqao.org/

source ./helper.sh $*
set_stage

#wget http://maqao.org/release/maqao.intel64-xeonphi.tar.bz2
cp $TOTIENT_PKG/archives/maqao.intel64-xeonphi.tar.bz2 .
tar -xjf maqao.intel64-xeonphi.tar.bz2

mkdir -p $PREFIX/maqao-2.1.1
mkdir -p $PREFIX/maqao-2.1.1/bin
mv maqao.intel64-xeonphi $PREFIX/maqao-2.1.1/bin/maqao
mv man $PREFIX/maqao-2.1.1

leave_stage
