#!/bin/sh
#
# Julia

source ./helper.sh
set_stage_dl https://github.com/JuliaLang/julia.git

BUILDOPTS="VERBOSE=1 USE_BLAS64=0 "
make $BUILDOPTS PREFIX=$PREFIX/julia install

leave_stage
