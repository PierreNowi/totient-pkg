#!/bin/sh
#
# SuiteSparse
# http://faculty.cse.tamu.edu/davis/suitesparse.html

source ./helper.sh
set_stage_dl http://faculty.cse.tamu.edu/davis/SuiteSparse/SuiteSparse-4.4.4.tar.gz

patch -p1 -i $MAGMA_PKG/patches/suitesparse-metis5.patch
cat >> SuiteSparse_config/SuiteSparse_config.mk <<EOF
# ============ Added variables =====================
INSTALL_LIB = $PREFIX/lib
INSTALL_INCLUDE = $PREFIX/include
BLAS = -L$PREFIX/OpenBLAS/lib -lopenblas
LAPACK = $PREFIX/lapack-3.5.0/lib/liblapack.a
METIS = $PREFIX/lib/libmetis.a
# ============ Added variables =====================
EOF
mkdir -p metis-4.0/Lib
cp $PREFIX/lib/libmetis.a metis-4.0/Lib
echo "all:" > metis-4.0/Makefile
make
make install

leave_stage
