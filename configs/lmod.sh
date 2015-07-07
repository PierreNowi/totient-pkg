#!/bin/sh
#
# LuaRocks

source ./helper.sh
stage_dl_ac \
  https://github.com/TACC/Lmod.git \
  --prefix=$PREFIX \
  --with-spider-Cache=$PREFIX/moduleData/cacheDir \
  --with-updateSystemFn=$PREFIX/moduleData/system.txt \
  --with-duplicatePaths=1 
