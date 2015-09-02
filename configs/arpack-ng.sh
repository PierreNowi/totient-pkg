#!/bin/sh
#
# ARPACK-ng -- Next generation ARPACK
# http://forge.scilab.org/index.php/p/arpack-ng/

module load openblas/gcc-4.9.2
module load lapack/3.5.0-gcc-4.9.2
BUILD_TAG=3.2.0-gcc-4.9.2

source ./helper.sh
stage_dl_ac https://github.com/opencollab/arpack-ng/archive/3.2.0.tar.gz
