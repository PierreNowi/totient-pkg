#!/bin/sh
#
# LuaRocks

source ./helper.sh
stage_dl_ac \
  ./Lmod-6.0.1.tar.bz2 \
  --prefix=$PREFIX \
  --with-spider-Cache=$PREFIX/moduleData/cacheDir \
  --with-updateSystemFn=$PREFIX/moduleData/system.txt \
  --with-duplicatePaths=1 
