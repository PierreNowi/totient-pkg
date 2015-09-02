#!/bin/sh
#
# HDF5 module generation
#
cat <<EOF
#%Module1.0
proc ModulesHelp { } {
  global dotversion
  puts stderr "HDF5 $VER ($TOOLCHAIN build)"
}
 
module-whatis "HDF5 $VER ($TOOLCHAIN build)"
set basedir /share/apps/hdf5-$VER-$TOOLCHAIN

prepend-path CPATH \$basedir/include
prepend-path LIBRARY_PATH \$basedir/lib
prepend-path LD_RUN_PATH \$basedir/lib
EOF
