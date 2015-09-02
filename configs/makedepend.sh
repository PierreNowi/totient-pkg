#!/bin/sh
#
# Makedepend

source ./helper.sh $*
stage_dl_ac http://xorg.freedesktop.org/releases/individual/util/makedepend-1.0.5.tar.gz \
  --prefix=$PREFIX/utils
