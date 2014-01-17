# Build scripts

These scripts grab a tarball or source repository, patch and configure it,
build it in a temporary directory, and install.  Common code is in `helper.sh`.
The default prefix for installations and staging area for builds can be set
by environment variables or by editing this script.

The `do_init.sh` script installs enough to get `tmux` working so that the rest
can be done from a `tmux` session without maintaining an active ssh connection.
The `do_all.sh` script runs the full install.

# Special notes

Many of the packages built "out-of-box" with the usual 
`./configure; make; make install` formula (encoded in the 
`stage_dl_ac` function in `helper.sh`).  There were a few exceptions
for packages that used alternate configuration systems

## GCC

I built GCC with `--disable-multilib` in order to avoid headaches where I'm
not sure whether we're working with a 32-bit or 64-bit version of the library.
The entire cluster is x86-64 machines, so it doesn't make sense otherwise.

We also built with `--with-cloog` in order to try to get Graphite support.

## gperftools

The `gperftools` build is a bit unusual in that it gets its own version of
`libunwind`.  This is 
because [http://gperftools.googlecode.com/svn/trunk/INSTALL](the install notes)
suggest `libunwind-0.99` works, but `libunwind-1.1` causes issues because it
internally calls `malloc` (which `gperftools` traps, dropping into libunwind
and causing a recursive call).  I *hope* I have not accidentally compiled
anything else with libunwind support inherited from the gperftools version.

## GraphViz

We run `dot -c` at the end of the script to update the plugin list.

## IPM

The build system needs a patch to work with the most recent autotools
(adding `subdir-objects` to the automake initialization calls).  Also,
since we're building from a repository without the `configure` script
checked in, we have to run `autoconf` ourselves.  This script could
easily break if they change the build script significantly!

## ISPC

At the time of this writing, this works with LLVM 3.3, but not with the
development version (3.5).

## libdwarf

This actually doesn't successfully build `dwarfdump`.  Apparently, this is
a known thing; fortunately, it doesn't matter, since the only reason I want
libdwarf at the moment is so that I can build DynInst for use with TAU.

## LLVM

The LLVM build assumes that tools are placed in a specific way; see
the LLVM web site for details.  We also have to specify the GCC
toolchain fairly explicitly if we want to get the correct `libstdc++`
-- even with all the paths set to point to the local GCC install, the
build picks out the local GCC otherwise.  See the coments to [this
StackOverflow question](http://stackoverflow.com/questions/10809371/clang-3-2-build-broken-after-building-gcc-4-7).

The development build of LLVM sometimes compiles, but it is not reliable.

## OpenBLAS

We're working on a heterogeneous cluster, and not all of the nodes
have CPUs that support AVX (though the head node does).  We use the
Nehalem kernels as a fallback, since everyone supports at least this
level.  One could perhaps set up the module script so that each node
points to an architecture-specific OpenBLAS in its `LD_LIBRARY_PATH`,
but I haven't done so yet.

## PAPI

The PAPI install is completely straightforward, but the heterogeneous
composition of C4 means that not all nodes make the same performance
counters available.

## PETSc

This is built with shared libraries partly to support `petsc4py`.

## Ploticus

I couldn't get this to build from source, so I gave up and grabbed the
binary package.

## SPRNG

The SPRNG 4.4 tarball hard-codes a system-specific `mpi.h` path and
doesn't properly support the `gfortran` name-mangling convention for
names with underscores.  The script patches these issues, and massages
the configure script into building.  We also pass in an explicit library
definition (since the code is linked with mpicc rather than mpicxx, but
uses the C++ MPI bindings); and an explicit macro definition for `LONG64`,
since this was incorrectly set in one of the files.  It is possible that
there are other things broken in this build, since it was evidently never
tested on an x86-64 system.  The fragility of the build was part of the
reason for isolating this in its own module.

## SuiteSparse

SuiteSparse doesn't have an automatic configuration script, so we drop
in our own.  We're using the `openblas` and `lapack-3.5.0` module
versions of BLAS and LAPACK, but it shouldn't make a real difference
for anything except the testers built into SuiteSparse.  I've also
incorporated a patch to make the system work with METIS5 rather than
METIS 4.0

## UPC

We don't have infiniband on the cluster, so I've disabled it.  Users
should default to the UDP transport layer for running across cluster
nodes, SMP for running on a single node.

## Visit

By default, VisIt builds without Mesa support, but Mesa is not installed
on the cluster, and we need *something* to do rendering.  Building Mesa
required installing `makedepend` and the Python package `libxml2`.  Note
that the `visit.sh` script requires some interactive input along the way;
it also takes quite a while to run.

