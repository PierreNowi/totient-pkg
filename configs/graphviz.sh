#!/bin/sh
#
# Graphviz
# http://www.graphviz.org

source ./helper.sh
stage_dl_ac http://www.graphviz.org/pub/graphviz/stable/SOURCES/graphviz-2.32.0.tar.gz --enable-swig=no

# Per dot's request...
$PREFIX/bin/dot -c
