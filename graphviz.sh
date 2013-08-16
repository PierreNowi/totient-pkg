#!/bin/sh
#
# Graphviz
# http://www.graphviz.org

DIRNAME=graphviz-2.32.0
TARBALL=$DIRNAME.tar.gz
URL=http://www.graphviz.org/pub/graphviz/stable/SOURCES/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME
./configure --prefix=$PREFIX \
  --enable-swig=no
make
make install
leave_stage

# Per dot's request...
$PREFIX/bin/dot -c
