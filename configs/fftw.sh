#!/bin/sh
#
# FFTW -- Fastest Fourier Transform in the West
# http://www.fftw.org/

source ./helper.sh $*
BUILD_TAG=3.3.4-$TOOLCHAIN

stage_dl_ac http://www.fftw.org/fftw-3.3.4.tar.gz \
	--prefix=$PREFIX/fftw-$BUILD_TAG
