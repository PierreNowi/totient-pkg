#!/bin/sh
#
# PAPI


DIRNAME=papi-5.2.0
TARBALL=$DIRNAME.tar.gz
URL=http://icl.cs.utk.edu/projects/papi/downloads/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME/src
./configure --prefix=$PREFIX 
make
make install
leave_stage
