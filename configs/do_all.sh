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

# flex and bison
./flex.sh
./bison.sh

# Boehm GC
./libatomic_ops.sh
./gc.sh

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
./iaca.sh

# HDF5 and NetCDF libraries
./szip.sh
./hdf5.sh
./netcdf.sh
./matio.sh

# GNU Database Manager
./gdbm.sh

# Only build OpenBLAS for GCC (ICC has issues with Haswell assembly kernel)
./openblas.sh gcc-4.9.2

# -- IPM (module)
./ploticus.sh

# -- Dyninst (module)
./dyninst.sh gcc-4.9.2

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

  # Profiling systems
  ./ipm.sh         $tc
  ./pdt.sh         $tc
  #./tau.sh         $tc
done

# GNU Linear Programming Kit
./glpk.sh

# Unified Parallel C
./upc.sh gcc-4.9.2

# -- gperftools (module)
./gperftools.sh


exit 0

# -- Build Julia (module)
./julia.sh

# -- Numerical frameworks (modules)
./petsc.sh
./slepc.sh
./sundials.sh
./trilinos.sh

# -- Build deal.II (module)
./dealii.sh

