#!/bin/sh
#
# LuaRocks

source ./helper.sh
LUA=lua-5.3.1
stage_dl_ac \
  http://keplerproject.github.io/luarocks/releases/luarocks-2.2.2.tar.gz \
  --prefix=$PREFIX/$LUA \
  --sysconfdir=$PREFIX/$LUA/etc/luarocks \
  --rocks-tree=$PREFIX/$LUA/lib/luarocks \
  --with-lua=$PREFIX/$LUA \
  --lua-version=5.3 
