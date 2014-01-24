#!/bin/sh
#
# Julia

source ./helper.sh
set_stage
set_stage_dl https://github.com/JuliaLang/julia.git

BUILDOPTS="VERBOSE=1 USE_BLAS64=0 USE_SYSTEM_BLAS=1"
make $BUILDOPTS PREFIX=$PREFIX/julia install

#for fname in $PREFIX/julia/bin/* ; do
#    echo $fname
#    patchelf --set-rpath '$ORIGIN/../lib/julia:$ORIGIN/../lib:/share/cs-instructional/cs5220/local/OpenBLAS/lib:/share/cs-instructional/cs5220/local/gcc-4.8.2/lib64:/share/cs-instructional/cs5220/local/gcc-4.8.2/lib:/share/cs-instructional/cs5220/local/lib64:/share/cs-instructional/cs5220/local/lib' $fname
#done

leave_stage
