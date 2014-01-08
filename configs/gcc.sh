#!/bin/sh
#
# GCC

VER=gcc-4.8.2
source $HOME/pkg/configs/helper.sh
stage_dl_ac http://gcc.parentingamerica.com/releases/$VER/$VER.tar.bz2 \
  --prefix=$PREFIX/$DIRNAME --disable-multilib --with-cloog
