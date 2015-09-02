#!/bin/sh
#
# LAPACK module generation
#
cat <<EOF
#%Module1.0
proc ModulesHelp { } {
  global dotversion
  puts stderr "LAPACK $VER ($TOOLCHAIN build)"
}
 
module-whatis "LAPACK $VER ($TOOLCHAIN build)"
set basedir /share/apps/lapack-$VER-$TOOLCHAIN

prepend-path CPATH \$basedir/include
prepend-path LIBRARY_PATH \$basedir/lib
prepend-path LD_RUN_PATH \$basedir/lib
EOF
