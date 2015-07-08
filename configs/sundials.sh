#!/bin/sh
#
# SUNDIALS (http://computation.llnl.gov/casc/sundials/download/download.html)
# (requires registration to actually get the code)

module load openblas
module load lapack
module load openmpi-1.8.6

source ./helper.sh
stage_dl_cmake sundials-2.6.1.tar.gz -DCMAKE_INSTALL_PREFIX=$PREFIX/$DIRNAME
