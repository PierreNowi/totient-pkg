#!/bin/sh
#
# Julia

DIRNAME=julia
URL=https://github.com/JuliaLang/$DIRNAME.git

source $HOME/pkg/configs/helper.sh
set_stage
git clone $URL
cd $DIRNAME
BUILDOPTS="VERBOSE=1 USE_BLAS64=0 "
for lib in BLAS LAPACK GMP MPFR; do
  BUILDOPTS="$BUILDOPTS USE_SYSTEM_$lib=1"
done
make $BUILDOPTS PREFIX=$PREFIX install
leave_stage
