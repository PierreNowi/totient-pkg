#!/bin/sh
#
# Patchelf

source ./helper.sh
stage_dl_ac http://releases.nixos.org/patchelf/patchelf-0.8/patchelf-0.8.tar.bz2\
  --prefix=$PREFIX/utils
