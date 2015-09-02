#!/bin/sh
#
# Generate ARPACK modules
#
cat <<EOF
#%Module1.0
proc ModulesHelp { } {
  global dotversion
  puts stderr "ARPACK $VER ($TOOLCHAIN build)"
}
 
module-whatis "ARPACK $VER ($TOOLCHAIN build)"
set basedir /share/apps/arpack-$VER-$TOOLCHAIN

prepend-path CPATH \$basedir/include
prepend-path LIBRARY_PATH \$basedir/lib
prepend-path LD_RUN_PATH \$basedir/lib
EOF
