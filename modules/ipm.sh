#!/bin/sh
#
# Generate IPM modules
#
cat <<EOF
#%Module1.0
proc ModulesHelp { } {
  global dotversion
  puts stderr "Integrated Performance Modeling ($TOOLCHAIN build)"
}
 
module-whatis "Integrated Performance Modeling ($TOOLCHAIN build)"
set basedir /share/apps/IPM-$TOOLCHAIN

prepend-path PATH \$basedir/bin
prepend-path LIBRARY_PATH \$basedir/lib
prepend-path LD_RUN_PATH \$basedir/lib
EOF
