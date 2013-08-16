#!/bin/sh
#
# Metis -- graph partitioning library
# http://glaros.dtc.umn.edu/gkhome/metis/metis/overview

DIRNAME=metis-5.1.0
TARBALL=$DIRNAME.tar.gz
URL=http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME
make config prefix=$PREFIX
make
make install
leave_stage
