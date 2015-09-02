#!/bin/sh
#
# Generate modules for OpenMPI
#
cat <<EOF
#%Module1.0
proc ModulesHelp { } {
  global dotversion
  puts stderr "OpenMPI $VER ($TOOLCHAIN build)"
}
 
module-whatis "OpenMPI $VER ($TOOLCHAIN build)"

set basedir /share/apps/openmpi-$VER-$TOOLCHAIN
prepend-path PATH \$basedir/bin
prepend-path CPATH \$basedir/include
prepend-path LIBRARY_PATH \$basedir/lib
prepend-path LD_RUN_PATH \$basedir/lib
prepend-path MANPATH \$basedir/man
EOF
