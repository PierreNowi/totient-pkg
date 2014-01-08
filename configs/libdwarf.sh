#!/bin/sh
#
# LibDwarf
# http://www.prevanders.net/dwarf.html

source $HOME/pkg/configs/helper.sh
set_stage_dl http://prevanders.net/libdwarf-20130729.tar.gz

./configure --enable-shared
make
cp libdwarf/libdwarf.so $PREFIX/lib
cp libdwarf/libdwarf.h libdwarf/dwarf.h $PREFIX/include
cp dwarfdump2/dwarfdump $PREFIX/bin

leave_stage 
