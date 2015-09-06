#!/bin/sh
#
# GSL (GNU Scientific Library)
# http://arma.sourceforge.net/

source ./helper.sh $*

module load openblas
module load lapack/3.5.0-$TOOLCHAIN
BUILD_TAG=1.16-$TOOLCHAIN

stage_dl_ac http://mirror.nexcess.net/gnu/gsl/gsl-1.16.tar.gz \
	--prefix=$PREFIX/gsl-$BUILD_TAG \
	--disable-static
