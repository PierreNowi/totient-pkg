#!/bin/sh
#
# Julia

source $HOME/pkg/configs/helper.sh
set_stage_dl https://github.com/JuliaLang/julia.git

BUILDOPTS="VERBOSE=1 USE_BLAS64=0 "
for lib in BLAS LAPACK ; do
  BUILDOPTS="$BUILDOPTS USE_SYSTEM_$lib=1"
done
make $BUILDOPTS PREFIX=$PREFIX/julia install

leave_stage
