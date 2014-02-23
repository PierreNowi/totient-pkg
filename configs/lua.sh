#!/bin/sh
#
# Lua

source ./helper.sh
set_stage

curl -O http://www.lua.org/ftp/lua-5.2.3.tar.gz
tar zxf lua-5.2.3.tar.gz
cd lua-5.2.3
make INSTALL_TOP=$PREFIX linux test install

leave_stage
