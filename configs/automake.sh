#!/bin/sh
#
# Automake

source ./helper.sh $*
stage_dl_ac http://ftp.gnu.org/gnu/automake/automake-1.15.tar.gz \
  --prefix=$PREFIX/utils
