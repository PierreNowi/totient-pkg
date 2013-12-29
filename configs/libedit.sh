#!/bin/sh
#
# LibEdit
# http://thrysoee.dk/editline/

DIRNAME=libedit-20130712-3.1
TARBALL=$DIRNAME.tar.gz
URL=http://thrysoee.dk/editline/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME
./configure --prefix=$PREFIX
make
make install
leave_stage 
