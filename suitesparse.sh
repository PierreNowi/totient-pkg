#!/bin/sh
#
# SuiteSparse
# http://www.cise.ufl.edu/research/sparse/SuiteSparse/

DIRNAME=SuiteSparse
TARBALL=$DIRNAME-4.2.1.tar.gz
URL=http://www.cise.ufl.edu/research/sparse/SuiteSparse/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME
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
make
make install
leave_stage
