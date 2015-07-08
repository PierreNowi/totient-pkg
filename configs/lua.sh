#!/bin/sh
#
# Lua

source ./helper.sh
set_stage
LUA=lua-5.3.1

curl -O http://www.lua.org/ftp/$LUA.tar.gz
tar zxf $LUA.tar.gz
cd $LUA
make INSTALL_TOP=$PREFIX/$LUA linux test install

leave_stage
