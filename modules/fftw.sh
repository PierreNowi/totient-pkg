#!/bin/sh
#
# Generate FFTW modules
#
cat <<EOF
#%Module1.0
proc ModulesHelp { } {
  global dotversion
  puts stderr "FFTW $VER ($TOOLCHAIN build)"
}
 
module-whatis "FFTW $VER ($TOOLCHAIN build)"
set basedir /share/apps/fftw-$VER-$TOOLCHAIN

prepend-path CPATH \$basedir/include
prepend-path LIBRARY_PATH \$basedir/lib
prepend-path LD_RUN_PATH \$basedir/lib
EOF
