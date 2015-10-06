#!/bin/sh
#
# Generate module for OpenBLAS
#
export BUILD_TAG=$VER

cat <<EOF
#%Module1.0
proc ModulesHelp { } {
  global dotversion
  puts stderr "LLVM $VER"
}
 
module-whatis "LLVM $VER"
module load llvm/$VER

set basedir /share/apps/llvm-$VER-analyzer
prepend-path PATH \$basedir
EOF
