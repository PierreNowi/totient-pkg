#!/bin/sh
#
# GSL (GNU Scientific Library)
# http://arma.sourceforge.net/

DIRNAME=gsl-1.16
TARBALL=$DIRNAME.tar.gz
URL=http://mirror.nexcess.net/gnu/gsl/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME
./configure --disable-static --prefix=$PREFIX
make
make install

leave_stage
