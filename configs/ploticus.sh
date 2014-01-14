#!/bin/sh
#
# Ploticus -- old school plotting package

source ./helper.sh
set_stage_dl http://downloads.sourceforge.net/project/ploticus/ploticus/2.42/ploticus242_linuxbin64.tar.gz

mkdir -p $PREFIX/ploticus
mv * $PREFIX/ploticus

leave_stage
