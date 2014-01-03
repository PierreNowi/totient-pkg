#!/bin/sh

# -- tmux lets us finish rebuilding without a window
./libevent.sh
./tmux.sh

# -- GraphViz, Doxygen, and curl with SSL for CMake (and others)
./graphviz.sh
./doxygen.sh
./curl.sh

# -- CMake
./cmake.sh 

# -- Build valgrind (module)
./valgrind.sh

# -- For building current GCC and CLang
./gmp.sh
./mpfr.sh
./mpc.sh
./isl.sh
./cloog.sh
./libedit.sh

# -- GCC 4.8.2 (module)
./gcc.sh
module load gcc-4.8.2

# -- For building LLVM and CLang (module)
./llvm.sh
./ispc.sh

# -- OpenMPI 1.6.5 (module)
./openmpi.sh
module load openmpi-1.6.5

# -- OpenBLAS (module)
./openblas.sh
module load openblas

# -- LAPACK (module)
./lapack.sh
module load lapack-3.5.0

# -- SPRNG (module)
./sprng.sh

# -- Boost
./boost.sh

# -- Standard numerical libraries
./fftw.sh
./arpack-ng.sh
./metis.sh
./suitesparse.sh
./eigen.sh
./armadillo.sh
./gsl.sh

# -- Profilers and the like
./libdwarf.sh
./dyninst.sh
./papi.sh

# -- PDT and TAU (module)
./pdt.sh
./tau.sh

# -- gperftools (module)
./gperftools.sh

# -- Numerical frameworks (modules)
./petsc.sh
./slepc.sh
./tao.sh
./sundials.sh
./trilinos.sh

# -- Build deal.II (module)
./dealii.sh

# -- Build Julia (module)
./julia.sh

# -- Build UPC (module)
./upc.sh
