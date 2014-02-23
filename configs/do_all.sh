#!/bin/sh
set -e

# -- Most everything goes into the base package -- set up appropriate path
module load cs5220-base

# -- GCC 4.8.2 + wrappers
./gcc.sh
./gcc_wrapper.sh

# -- Let's build everything else with the new GCC
module load gcc-4.8.2

# -- tmux lets us finish rebuilding without a window
./libevent.sh
./tmux.sh

# -- GraphViz, Doxygen, and curl with SSL for CMake (and others)
./graphviz.sh
./doxygen.sh
./curl.sh

# -- Most recent autoconf/automake/libtool
./patchelf.sh
./makedepend.sh
./libtool.sh
./autoconf.sh
./automake.sh

# -- CMake
./cmake.sh 

# -- Build valgrind
./valgrind.sh

# -- For building current CLang
./libedit.sh

# -- libunwind (useful for mpiP)
./libunwind.sh

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
./hwloc.sh

# -- Lua
./lua.sh

# -- FFMPEG (enough for coding vids)
./yasm.sh
./x264.sh
./ffmpeg.sh

# -- PDT and TAU (module)
./pdt.sh
./tau.sh

# -- gperftools (module)
./gperftools.sh

# -- IPM (module)
./ploticus.sh
./ipm.sh

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

