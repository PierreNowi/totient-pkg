#!/bin/sh
#
# MatIO

source ./helper.sh
SF=http://downloads.sourceforge.net/project
stage_dl_ac $SF/matio/matio/1.5.2/matio-1.5.2.tar.gz \
  --with-zlib=$PREFIX \
  --with-hdf5=$PREFIX
