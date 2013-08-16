#!/bin/sh
#
# ARPACK-ng -- Next generation ARPACK
# http://forge.scilab.org/index.php/p/arpack-ng/

DIRNAME=arpack-ng-3.1.3
TARBALL=$DIRNAME.tar.gz
URL=http://forge.scilab.org/index.php/p/arpack-ng/downloads/get/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME
./configure --prefix=$PREFIX
make
make install
leave_stage 
