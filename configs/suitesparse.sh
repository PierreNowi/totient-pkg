#!/bin/sh
#
# SuiteSparse
# http://www.cise.ufl.edu/research/sparse/SuiteSparse/

source ./helper.sh
set_stage_dl http://www.cise.ufl.edu/research/sparse/SuiteSparse/SuiteSparse-4.2.1.tar.gz

patch -p1 -i $MAGMA_PKG/patches/suitesparse-metis5.patch
cat >> SuiteSparse_config/SuiteSparse_config.mk <<EOF
# ============ Added variables =====================
INSTALL_LIB = $PREFIX/lib
INSTALL_INCLUDE = $PREFIX/include
BLAS = -L$PREFIX/OpenBLAS/lib -lopenblas
LAPACK = $PREFIX/liblapack-3.5.0/lib/liblapack.a
METIS = $PREFIX/lib/libmetis.a
# ============ Added variables =====================
EOF
mkdir -p metis-4.0/Lib
cp $PREFIX/lib/libmetis.a metis-4.0/Lib
echo "all:" > metis-4.0/Lib/Makefile
make
make install

leave_stage
