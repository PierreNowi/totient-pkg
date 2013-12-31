#!/bin/sh
#
# LibDwarf
# http://www.prevanders.net/dwarf.html

DIRNAME=dwarf-20130729
TARBALL=lib$DIRNAME.tar.gz
URL=http://prevanders.net/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME
./configure --enable-shared
make
cp libdwarf/libdwarf.so $PREFIX/lib
cp libdwarf/libdwarf.h libdwarf/dwarf.h $PREFIX/include
cp dwarfdump2/dwarfdump $PREFIX/bin
leave_stage 
