#!/bin/sh

# -- tmux lets us finish rebuilding without a window
./libevent.sh
./tmux.sh

# -- GraphViz, Doxygen, and curl with SSL for CMake (and others)
./graphviz.sh
./doxygen.sh
./curl.sh

# -- Most recent autoconf/automake/libtool
./libtool.sh
./autoconf.sh
./automake.sh
./makedepend.sh

# -- CMake
./cmake.sh 

# -- Build valgrind
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

# -- OpenMPI 1.6.5 (module)
./openmpi.sh

# -- OpenBLAS (module)
./openblas.sh

# -- LAPACK (module)
./lapack.sh

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

# -- HDF5 and NetCDF libraries
./szip.sh
./hdf5.sh
./netcdf.sh

# -- Profilers and the like
./libdwarf.sh
./dyninst.sh
./papi.sh

# -- PDT and TAU (module)
./pdt.sh
./tau.sh

# -- gperftools (module)
./gperftools.sh

# -- IPM (module)
./ploticus.sh
./ipm.sh

# -- Links and Lynx browsers (modules)
./links.sh
./lynx.sh

# -- For building LLVM and CLang (module)
./llvm.sh
./ispc.sh

# -- Build Julia (module)
./julia.sh

# -- Build UPC (module)
./upc.sh

# -- Numerical frameworks (modules)
./petsc.sh
./slepc.sh
./tao.sh
./sundials.sh
./trilinos.sh

# -- Build deal.II (module)
./dealii.sh

