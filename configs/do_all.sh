#!/bin/bash

# Halt on errors and send output to build.log as well as screen
# Ref: http://bit.ly/1PKWIsw
set -e
exec > >(tee -a build.log) 2>&1

# Load nothing by default
module purge

# GCC 5
./binutils.sh
./gcc5.sh
./gcc5_wrapper.sh

# Archiver libraries
./zlib.sh
./bzip2.sh
./xz.sh

# Git and dependencies
./curl.sh
./expat.sh
./git.sh

# CMake
./cmake.sh

# Autotools and associated utils
./patchelf.sh
./makedepend.sh
./libtool.sh
./autoconf.sh
./automake.sh

# For building current CLang
./libedit.sh

# For building LLVM and CLang (module)
# NB: Need to fix issue with wrong toolchain detection before ISPC will build!
./llvm.sh
./llvm37.sh
./ispc.sh

# libunwind (useful for mpiP)
./libunwind.sh

# FFMPEG and prereqs (enough for coding vids)
./yasm.sh
./x264.sh
./ffmpeg.sh

# Local LibELF / LibDwarf (in module)
./libelf.sh
./libdwarf.sh

# Profiler support
./papi.sh
./hwloc.sh
./lshw.sh

# HDF5 and NetCDF libraries
./szip.sh
./hdf5.sh
./netcdf.sh
./matio.sh

# Only build OpenBLAS for GCC (ICC has issues with Haswell assembly kernel)
./openblas.sh gcc-4.9.2

# General support modules (GCC and ICC versions)
for tc in gcc-4.9.2 icc-15.0.3 ; do

  # Boost and OpenMPI frameworks
  ./boost.sh       $tc
  ./openmpi.sh     $tc

  # Misc numerical libraries
  ./lapack.sh      $tc
  ./metis.sh       $tc
  ./suitesparse.sh $tc
  ./fftw.sh        $tc
  ./arpack-ng.sh   $tc
  ./eigen.sh       $tc
  ./armadillo.sh   $tc
  ./gsl.sh         $tc
  #./glm.sh         $tc

done

./upc.sh

exit 0

# -- gperftools (module)
./gperftools.sh

# -- IPM (module)
# ./ploticus.sh
# ./ipm.sh


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

