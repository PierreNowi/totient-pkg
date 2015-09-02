#!/bin/sh
#
# Autoconf

source ./helper.sh $*
stage_dl_ac http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz \
    --prefix=$PREFIX/utils
