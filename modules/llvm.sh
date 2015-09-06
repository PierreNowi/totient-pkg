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

set basedir /share/apps/llvm-$VER
setenv LLVM_HOME \$basedir
prepend-path PATH \$basedir/bin
prepend-path CPATH \$basedir/include
prepend-path LIBRARY_PATH \$basedir/lib
prepend-path LD_RUN_PATH \$basedir/lib
prepend-path MANPATH \$basedir/man
EOF
