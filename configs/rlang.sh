#!/bin/sh
#
# R -- a statistics language
# http://www.r-project.org/

source ./helper.sh
stage_dl_ac http://lib.stat.cmu.edu/R/CRAN/src/base/R-3/R-3.2.1.tar.gz \
    --with-lapack="-llapack" \
    --with-blas="-lopenblas" \
    --prefix=$PREFIX/R-3.2.1
