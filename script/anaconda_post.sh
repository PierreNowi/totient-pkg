#!/bin/sh
#
# Anaconda post-install setup.  This is my recollection of what
# I did, but has not actually been tested...

APATH=$HOME/local/anaconda
export PATH=$APATH/bin:$PATH

# Make sure we can get pip to play nicely with everything
conda update conda
conda update distribute
conda update setuptools
conda update pip

# Back up the MPI files
pushd $APATH/bin
mkdir mpi-bak
mv mpi* mpi-bak
popd
