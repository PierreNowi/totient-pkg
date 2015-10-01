#!/bin/sh
#
# Ploticus -- old school plotting package

source ./helper.sh $*
set_stage_dl http://downloads.sourceforge.net/project/ploticus/ploticus/2.42/ploticus242_linuxbin64.tar.gz

rm -rf $PREFIX/ploticus-2.42
mkdir -p $PREFIX/ploticus-2.42
mv * $PREFIX/ploticus-2.42

leave_stage
