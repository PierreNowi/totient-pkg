#!/bin/sh
#
# SUNDIALS (http://computation.llnl.gov/casc/sundials/download/download.html)
# (requires registration to actually get the code)

source ./helper.sh
stage_dl_ac sundials-2.5.0.tar.gz --prefix=$PREFIX/$DIRNAME
