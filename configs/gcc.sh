#!/bin/sh
#
# GCC

VER=gcc-4.8.2
source ./helper.sh

# -- Set up paths
export LIBRARY_PATH=$PREFIX/$VER/lib:$PREFIX/$VER/lib64
export LD_RUN_PATH=$PREFIX/$VER/lib:$PREFIX/$VER/lib64
export CPATH=$PREFIX/$VER/lib:$PREFIX/$VER/include

set_stage

# -- Download prerequisites
run_dl_ac ftp://ftp.gnu.org/gnu/gmp/gmp-5.1.3.tar.bz2 --enable-cxx \
    --prefix=$PREFIX/$VER
run_dl_ac http://www.mpfr.org/mpfr-current/mpfr-3.1.2.tar.bz2 \
    --prefix=$PREFIX/$VER
run_dl_ac http://www.multiprecision.org/mpc/download/mpc-1.0.1.tar.gz \
    --prefix=$PREFIX/$VER

# -- Support Graphite
run_dl_ac http://isl.gforge.inria.fr/isl-0.12.2.tar.bz2 \
    --prefix=$PREFIX/$VER
run_dl_ac http://www.bastoul.net/cloog/pages/download/count.php3?url=./cloog-0.18.1.tar.gz \
    --with-bits=gmp --prefix=$PREFIX/$VER 

# -- the main event
run_dl_ac http://gcc.parentingamerica.com/releases/$VER/$VER.tar.bz2 \
  --prefix=$PREFIX/$VER \
  --disable-multilib \
  --with-cloog  \
  --program-suffix=-4.8.2

leave_stage
