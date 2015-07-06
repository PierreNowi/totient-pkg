#!/bin/sh
#
# Julia

source ./helper.sh
set_stage
set_stage_dl https://github.com/JuliaLang/julia.git

module load openblas
module load anaconda
module load lapack

export LD_LIBRARY_PATH=$HOME/local/anaconda/lib:$LD_LIBRARY_PATH
BUILDOPTS="JULIA_CPU_TARGET=core2 VERBOSE=1 USE_BLAS64=0 USE_SYSTEM_BLAS=1"
make $BUILDOPTS prefix=$PREFIX/julia-2015-07-04 install

leave_stage
