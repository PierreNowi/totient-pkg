#!/bin/sh
#
# elfutils

source ./helper.sh $*
BUILD_TAG=0.163

stage_dl_ac https://fedorahosted.org/releases/e/l/elfutils/0.163/elfutils-0.163.tar.bz2 --prefix=$PREFIX/utils

