#!/bin/sh
#
# Generate METIS modules
#
cat <<EOF
#%Module1.0
proc ModulesHelp { } {
  global dotversion
  puts stderr "Metis graph partitioner $VER ($TOOLCHAIN build)"
}
 
module-whatis "Metis graph partitioner $VER ($TOOLCHAIN build)"
set basedir /share/apps/metis-$VER-$TOOLCHAIN

prepend-path CPATH \$basedir/include
prepend-path LIBRARY_PATH \$basedir/lib
prepend-path LD_RUN_PATH \$basedir/lib
EOF
