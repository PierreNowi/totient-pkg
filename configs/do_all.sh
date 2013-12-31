#!/bin/sh

# -- tmux lets us finish rebuilding without a window
./libevent.sh
./tmux.sh

# -- GraphViz and Doxygen required for other things
./graphviz.sh
./doxygen.sh

# -- We want curl with SSL support for CMake
./curl.sh
./cmake.sh

# -- Build valgrind
./valgrind.sh

# -- For building a current version of GCC
./gmp.sh
./mpfr.sh
./mpc.sh
./gcc.sh

# -- For building LLVM and CLang
./libedit.sh
./llvm.sh

# -- Set up some numerical libraries
./openblas.sh
./lapack.sh
./arpack-ng.sh
./fftw.sh
./metis.sh
./suitesparse.sh
./eigen.sh
./armadillo.sh

# -- Build profilers and the like
./libdwarf.sh
./dyninst.sh
./papi.sh
./pdt.sh
./tau.sh

# -- Build Boost
./boost.sh

# -- Build PETSc, SLEPc, and TAO
./petsc.sh
./slepc.sh
./tao.sh

# -- Build Trilinos and deal.II
./trilinos.sh
./dealii.sh

# -- Build Julia, UPC, and ISPC
./julia.sh
./upc.sh
./ispc.sh
