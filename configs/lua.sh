#!/bin/sh
#
# Tau

source ./helper.sh $*
set_stage_dl http://www.lua.org/ftp/lua-5.3.1.tar.gz

make linux install INSTALL_TOP=$PREFIX/utils

leave_stage
