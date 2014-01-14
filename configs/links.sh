#!/bin/sh
#
# Autoconf

source $HOME/pkg/configs/helper.sh
stage_dl_ac http://links.twibright.com/download/links-2.8.tar.bz2 \
	--prefix=$PREFIX/links-2.8 \
	--with-ssl
