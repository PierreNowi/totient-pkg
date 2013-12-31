#!/bin/sh
#
# DynInst

DIRNAME=DyninstAPI-8.1.2
TARBALL=$DIRNAME.tgz
URL=http://www.dyninst.org/sites/default/files/downloads/dyninst/8.1.2/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME
./configure -prefix=$PREFIX
make install
leave_stage
