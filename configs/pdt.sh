#!/bin/sh
#
# PDT

DIRNAME=pdtoolkit-3.20
TARBALL=pdt.tgz
URL=http://tau.uoregon.edu/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME
./configure -prefix=$PREFIX/pdt -GNU
make install -j
leave_stage
