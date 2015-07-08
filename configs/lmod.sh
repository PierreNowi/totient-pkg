#!/bin/sh
#
# LMod

module load lua-5.3.1

source ./helper.sh

eval `luarocks path`
LUA=lua-5.3.1
stage_dl_ac \
  https://github.com/TACC/Lmod.git \
  --prefix=$PREFIX/$LUA \
  --with-spiderCacheDir=$PREFIX/moduleData/cacheDir \
  --with-updateSystemFn=$PREFIX/moduleData/system.txt \
  --with-duplicatePaths=1 

rm -rf $PREFIX/$LUA/lmod/lmod
ln -s $PREFIX/$LUA/lmod $PREFIX/$LUA/lmod/lmod
