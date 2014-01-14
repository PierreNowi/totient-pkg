#!/bin/sh
#
# Autoconf

source $HOME/pkg/configs/helper.sh
stage_dl_ac http://lynx.isc.org/lynx2.8.7/lynx2.8.7.tar.bz2 \
	--prefix=$PREFIX/lynx-2.8.7 \
	--with-ssl
