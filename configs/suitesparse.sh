#!/bin/sh
#
# SuiteSparse
# http://faculty.cse.tamu.edu/davis/suitesparse.html

BUILD_TAG=4.4.5-gcc-4.9.2
module load openblas/gcc-4.9.2
module load lapack/3.5.0-gcc-4.9.2

source ./helper.sh
set_stage_dl http://faculty.cse.tamu.edu/davis/SuiteSparse/SuiteSparse-4.4.5.tar.gz

CC=gcc
INSTALL=$PREFIX/SuiteSparse-$BUILD_TAG
cat >> SuiteSparse_config/SuiteSparse_config.mk <<EOF
# ============ Added variables =====================
INSTALL_LIB = $INSTALL/lib
INSTALL_INCLUDE = $INSTALL/include
BLAS = -L$PREFIX/OpenBLAS/lib -lopenblas
LAPACK = -L$PREFIX/lapack-3.5.0/lib/ -llapack
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
