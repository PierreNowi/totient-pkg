#!/bin/sh
#
# LuaRocks

source ./helper.sh
LUA=lua-5.3.1
stage_dl_ac \
  https://github.com/TACC/Lmod.git \
  --prefix=$PREFIX/$LUA \
  --with-spider-Cache=$PREFIX/moduleData/cacheDir \
  --with-updateSystemFn=$PREFIX/moduleData/system.txt \
  --with-duplicatePaths=1 
