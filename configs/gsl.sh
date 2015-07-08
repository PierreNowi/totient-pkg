#!/bin/sh
#
# GSL (GNU Scientific Library)
# http://arma.sourceforge.net/

module load openblas
module load lapack

source ./helper.sh
stage_dl_ac http://mirror.nexcess.net/gnu/gsl/gsl-1.16.tar.gz --disable-static
