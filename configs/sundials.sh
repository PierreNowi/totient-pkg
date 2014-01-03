#!/bin/sh
#
# SUNDIALS (http://computation.llnl.gov/casc/sundials/download/download.html)
# (requires registration to actually get the code)

DIRNAME=sundials-2.5.0
TARBALL=$DIRNAME.tar.gz
URL=$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME
./configure --prefix=$PREFIX/$DIRNAME
make
make install
leave_stage
