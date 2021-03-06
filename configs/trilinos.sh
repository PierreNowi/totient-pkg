#!/bin/sh
#
# Trilinos
# http://trilinos.sandia.gov/
#
# Notes:
# - For PyTrilinos, need up to date SWIG (via conda)
# - We explicitly enable/disable packages rather than building all.

PKG_ON="
Epetra EpetraExt Tpetra Kokkos
AztechOO IFPACK Ifpack2 ML Teko
Teuchos AztecOO Belos Komplex Amesos Amesos2
NOX LOCA ROL MOOCHO Piro Rhythmos GlobiPack OptiPack
Anasazi"

# These packages are explicitly disabled
PKG_OFF=""

#
pkgs=""
for pkg in `echo $PKG_ON` ; do
  pkgs="$pkgs -D Trilinos_ENABLE_$pkg:BOOL=ON"
done
for pkg in `echo $PKG_OFF` ; do
  pkgs="$pkgs -D Trilinos_ENABLE_$pkg:BOOL=OFF"
done

module load openblas
module load lapack
module load suitesparse
module load openmpi-1.8.6

source ./helper.sh $*
set_stage_dl http://trilinos.csbsju.edu/download/files/trilinos-12.0.1-Source.tar.bz2

# Build shared libraries
mkdir build_shared
cd build_shared

cmake \
-D CMAKE_INSTALL_PREFIX:PATH=$PREFIX/trilinos/serial-opt-shared \
-D BUILD_SHARED_LIBS:BOOL=ON \
\
-D TPL_ENABLE_BLAS:BOOL=ON \
-D BLAS_INCLUDE_DIRS:PATH="$PREFIX/OpenBLAS/" \
-D BLAS_LIBRARY_DIRS:FILEPATH="$PREFIX/OpenBLAS/lib" \
-D BLAS_LIBRARY_NAMES:STRING="libopenblas.so" \
\
-D TPL_ENABLE_LAPACK:BOOL=ON \
-D LAPACK_INCLUDE_DIRS:PATH="$PREFIX/lapack-3.5.0/include" \
-D LAPACK_LIBRARY_DIRS:FILEPATH="$PREFIX/lapack-3.5.0/lib" \
-D LAPACK_LIBRARY_NAMES:STRING="liblapack.so" \
\
-D TPL_ENABLE_MPI:BOOL=OFF \
-D CMAKE_Fortran_FLAGS:STRING="-O5" \
-D MEMORYCHECK_COMMAND:FILEPATH=$PREFIX/bin/valgrind \
-D DART_TESTING_TIMEOUT:STRING=600 \
-D CMAKE_VERBOSE_MAKEFILE:BOOL=TRUE \
\
$pkgs \
-D Trilinos_ENABLE_EXPLICIT_INSTANTIATION:BOOL=ON \
-D TPL_ENABLE_Boost:BOOL=ON \
..

make
make install

leave_stage
