#!/bin/sh
#
# MatIO module generation
#
cat <<EOF
#%Module1.0
proc ModulesHelp { } {
  global dotversion
  puts stderr "MatIO $VER ($TOOLCHAIN build)"
}
 
module-whatis "MatIO $VER ($TOOLCHAIN build)"
set basedir /share/apps/matio-$VER-$TOOLCHAIN

prepend-path CPATH \$basedir/include
prepend-path LIBRARY_PATH \$basedir/lib
prepend-path LD_RUN_PATH \$basedir/lib
EOF
