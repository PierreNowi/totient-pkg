#!/bin/bash

# Halt on errors and send output to build.log as well as screen
# Ref: http://bit.ly/1PKWIsw
set -e
exec > >(tee -a build.log) 2>&1

# -- Most everything goes into the base package -- set up appropriate path
#    Otherwise we want the base system
module purge

# -- Up-to-date binutils
./binutils.sh

# -- GCC 5.2.0 + wrappers
#./gcc5.sh
#./gcc5_wrapper.sh

# -- Let's build everything else with the new GCC
#module load gcc/5.2.0
#module load utils
module load devtoolset
module load utils

# -- zlib and bzip2
./zlib.sh
./bzip2.sh

# -- Updated git
./curl.sh
./expat.sh
./git.sh

# -- CMake
./cmake.sh 

# -- GraphViz, Doxygen, and curl with SSL for CMake (and others)
#./graphviz.sh
#./doxygen.sh

# -- Most recent autoconf/automake/libtool
./patchelf.sh
./makedepend.sh
./libtool.sh
./autoconf.sh
./automake.sh

# -- Build valgrind
#./valgrind.sh

# -- For building current CLang
./libedit.sh

# -- libunwind (useful for mpiP)
./libunwind.sh

# -- OpenMPI 1.10.0 (module)
./openmpi.sh

# -- OpenBLAS (module)
./openblas.sh

# -- LAPACK (module)
./lapack.sh

# -- SPRNG (module)
# ./sprng.sh

# -- Boost
./boost.sh

# -- Standard numerical libraries
./fftw.sh
./arpack-ng.sh
./metis.sh
./suitesparse.sh
exit 0
./eigen.sh
./armadillo.sh
./gsl.sh

# -- HDF5 and NetCDF libraries
./szip.sh
./hdf5.sh
./netcdf.sh
./matio.sh

# -- GLM (used by Trilionos)
./glm.sh

# -- Profilers and the like
./libdwarf.sh
# ./dyninst.sh
./papi.sh
./hwloc.sh

# -- FFMPEG (enough for coding vids)
./yasm.sh
./x264.sh
./ffmpeg.sh

# -- PDT and TAU (module)
# ./pdt.sh
# ./tau.sh

# -- gperftools (module)
./gperftools.sh

# -- IPM (module)
# ./ploticus.sh
# ./ipm.sh

# -- For building LLVM and CLang (module)
./llvm.sh
exit 0
./ispc.sh

# -- Build Julia (module)
./julia.sh

# -- Build UPC (module)
./upc.sh

# -- Numerical frameworks (modules)
./petsc.sh
./slepc.sh
./sundials.sh
./trilinos.sh

# -- Build deal.II (module)
./dealii.sh

