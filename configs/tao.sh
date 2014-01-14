#!/bin/sh
#
# TAO: Toolkit for Advanced Optimization

DIRNAME=tao-2.2.0
TARBALL=$DIRNAME.tar.gz
URL=http://www.mcs.anl.gov/research/projects/tao/download/$TARBALL

source ./helper.sh
set_stage_dl $URL

export TAO_DIR=$PWD
module load petsc
make all
cd ..
rm -rf $PREFIX/$DIRNAME
mv $DIRNAME $PREFIX

leave_stage
