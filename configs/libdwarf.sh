#!/bin/sh
#
# LibDwarf
# http://www.prevanders.net/dwarf.html

source ./helper.sh $*
set_stage_dl http://prevanders.net/libdwarf-20150507.tar.gz

# Note: build is known to fail when running tag_tree_build; lib still works
./configure --enable-shared
set +e
make
set -e
cp libdwarf/libdwarf.so $PREFIX/libelf-0.163/lib
cp libdwarf/libdwarf.h libdwarf/dwarf.h $PREFIX/libelf-0.163/include
#cp dwarfdump2/dwarfdump $PREFIX/bin

leave_stage 
