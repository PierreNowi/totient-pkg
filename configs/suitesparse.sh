#!/bin/sh
#
# SuiteSparse
# http://faculty.cse.tamu.edu/davis/suitesparse.html

source ./helper.sh $*

module load openblas/$TOOLCHAIN
module load lapack/3.5.0-$TOOLCHAIN
BUILD_TAG=4.4.5-$TOOLCHAIN

set_stage_dl http://faculty.cse.tamu.edu/davis/SuiteSparse/SuiteSparse-4.4.5.tar.gz

INSTALL=$PREFIX/SuiteSparse-$BUILD_TAG
cat >> SuiteSparse_config/SuiteSparse_config.mk <<EOF
# ============ Added variables =====================
INSTALL_LIB = $INSTALL/lib
INSTALL_INCLUDE = $INSTALL/include
BLAS = -L$PREFIX/OpenBLAS-$TOOLCHAIN/lib -lopenblas
LAPACK = -L$PREFIX/lapack-3.5.0-$TOOLCHAIN/lib/ -llapack $FLIBS
# ============ Added variables =====================
EOF

wgetl http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/OLD/metis-4.0.1.tar.gz
tar -xzf metis-4.0.1.tar.gz
cat >> metis-4.0/Makefile.in <<EOF
# ============ Added variables =====================
CC = $CC
OPTFLAGS = -O3 -fPIC
# ============ Added variables =====================
EOF
sed -i metis-4.0/Lib/rename.h -e 's/__/METIS401__/'


make
mkdir -p $INSTALL/lib
mkdir -p $INSTALL/include
make install
cp metis-4.0/libmetis.a $INSTALL/lib

leave_stage
