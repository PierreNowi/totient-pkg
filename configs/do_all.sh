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
./gcc5.sh
./gcc5_wrapper.sh

# -- Let's build everything else with the new GCC
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

# -- Most recent autoconf/automake/libtool
./patchelf.sh
./makedepend.sh
./libtool.sh
./autoconf.sh
./automake.sh

# -- For building current CLang
./libedit.sh

# -- libunwind (useful for mpiP)
./libunwind.sh

# -- General support modules
./openmpi.sh gcc-4.9.2
./openblas.sh gcc-4.9.2
./lapack.sh gcc-4.9.2
./boost.sh gcc-4.9.2

module load psxe
export CC=icc
export CXX=icpc
export FC=ifort

./openmpi.sh icc-15.0.3
./openblas.sh icc-15.0.3
./lapack.sh icc-15.0.3
./boost.sh icc-15.0.3

exit 0

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

