#!/bin/sh
#
# SuiteSparse
# http://www.cise.ufl.edu/research/sparse/SuiteSparse/

source $HOME/pkg/configs/helper.sh
set_stage_dl http://www.cise.ufl.edu/research/sparse/SuiteSparse/SuiteSparse-4.2.1.tar.gz

patch -p1 -i $HOME/pkg/patches/suitesparse-metis5.patch
cat >> SuiteSparse_config/SuiteSparse_config.mk <<EOF
# ============ Added variables =====================
INSTALL_LIB = $PREFIX/lib
INSTALL_INCLUDE = $PREFIX/include
BLAS = -L$PREFIX/lib -lopenblas
LAPACK = $PREFIX/lib/liblapack.a
METIS = $PREFIX/lib/libmetis.a
# ============ Added variables =====================
EOF
mkdir -p metis-4.0/Lib
cp $PREFIX/lib/libmetis.a metis-4.0/Lib
echo "all:" > metis-4.0/Lib/Makefile
make
make install

leave_stage
