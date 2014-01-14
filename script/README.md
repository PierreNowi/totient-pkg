# c4-pkg scripts

Common scripts to ease working on C4.

## Setup

The `setup.sh` script will modify a users `.bash_profile` and `.bashrc` 
so that `.bashrc` is always sourced and so that `.bashrc` sources
the `vars.sh` script to update the module path and install a default
set of modules.  There is also a `vars.csh` script for csh afficionados;
but since that is not the default shell, I assume these people know enough
about what they are doing to update their own startup files.

## IPython profile setup

The `setup_ipython_htc.sh` script sets up an IPython profile (`htc`)
for running `ipcluster` jobs on C4.  The `setup_ipython_mpi.sh` script
sets up a similar IPython profile (`mpi`) for running `ipcluster` jobs
on C4 with `mpi4py` enabled.

## MPI and UPC submissions

The `mpisub` and `upcsub` wrappers are installed atop the `openmpi-1.6.5`
and `upc` local subtrees.  These wrappers generate and submit an HTCondor
submission script.  Both assume the user is going to run out of a shared
directory (whatever directory the script was called form) rather than
the scratch directory that HTCondor dumps them to.

