#!/bin/sh
#
# Generate module for OpenBLAS
#
export BUILD_TAG=$TOOLCHAIN

cat <<EOF
#%Module1.0
proc ModulesHelp { } {
  global dotversion
  puts stderr "OpenBLAS ($TOOLCHAIN build)"
}
 
module-whatis "OpenBLAS ($TOOLCHAIN build)"
set basedir /share/apps/OpenBLAS-$TOOLCHAIN

prepend-path CPATH \$basedir/include
prepend-path LIBRARY_PATH \$basedir/lib
prepend-path LD_RUN_PATH \$basedir/lib
EOF
