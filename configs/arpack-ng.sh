#!/bin/sh
#
# ARPACK-ng -- Next generation ARPACK
# http://forge.scilab.org/index.php/p/arpack-ng/

source ./helper.sh $*

module load openblas
module load lapack/3.5.0-$TOOLCHAIN
BUILD_TAG=3.2.0-$TOOLCHAIN

stage_dl_ac https://github.com/opencollab/arpack-ng/archive/3.2.0.tar.gz \
	--prefix=$PREFIX/arpack-$BUILD_TAG
