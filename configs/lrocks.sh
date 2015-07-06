#!/bin/sh
#
# LuaRocks

source ./helper.sh
stage_dl_ac \
  http://keplerproject.github.io/luarocks/releases/luarocks-2.2.2.tar.gz \
  --prefix=$PREFIX \
  --sysconfdir=$PREFIX/etc/luarocks \
  --rocks-tree=$PREFIX/lib/luarocks \
  --with-lua=$PREFIX \
  --lua-version=5.3 
