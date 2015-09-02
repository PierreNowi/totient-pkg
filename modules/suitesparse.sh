#!/bin/sh
#
# Generate SuiteSparse modules
#
cat <<EOF
#%Module1.0
proc ModulesHelp { } {
  global dotversion
  puts stderr "SuiteSparse $VER ($TOOLCHAIN build)"
}
 
module-whatis "SuiteSparse $VER ($TOOLCHAIN build)"
set basedir /share/apps/SuiteSparse-$VER-$TOOLCHAIN

prepend-path CPATH \$basedir/include
prepend-path LIBRARY_PATH \$basedir/lib
prepend-path LD_RUN_PATH \$basedir/lib
EOF
