#!/bin/sh
#
# FFTW -- Fastest Fourier Transform in the West
# http://www.fftw.org/

DIRNAME=fftw-3.3.3
TARBALL=$DIRNAME.tar.gz
URL=http://www.fftw.org/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME
./configure --prefix=$PREFIX 
make
make install
leave_stage
