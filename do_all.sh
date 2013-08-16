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

# -- For when we eventually want to rebuild GCC
./gmp.sh
./mpfr.sh

# -- Set up some numerical libraries
./openblas.sh
./lapack.sh
./arpack-ng.sh
./fftw.sh
./metis.sh
./suitesparse.sh
./eigen.sh

# -- Build Boost
./boost.sh

# -- Build Trilinos and deal.II
./trilinos.sh
./dealii.sh
