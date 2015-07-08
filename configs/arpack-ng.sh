#!/bin/sh
#
# ARPACK-ng -- Next generation ARPACK
# http://forge.scilab.org/index.php/p/arpack-ng/

module load openblas
module load lapack

source ./helper.sh
stage_dl_ac https://github.com/opencollab/arpack-ng/archive/3.2.0.tar.gz
