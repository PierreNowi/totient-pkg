#!/bin/sh
#
# Ldoc -- my little literate documentation tool

source ./helper.sh $*
set_stage

git clone https://bitbucket.org/dbindel/nanobush
cd nanobush/ldoc
cmake . -DCMAKE_INSTALL_PREFIX=$PREFIX
make install

leave_stage
