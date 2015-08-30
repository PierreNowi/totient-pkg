#!/bin/sh
#
# Binutils

source ./helper.sh
stage_dl_ac http://ftp.gnu.org/gnu/binutils/binutils-2.25.1.tar.bz2 \
    --prefix=$PREFIX/utils
