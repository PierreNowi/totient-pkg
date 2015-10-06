#!/bin/sh
#
# Generate TAU modules
#
cat <<EOF
#%Module1.0
proc ModulesHelp { } {
  global dotversion
  puts stderr "Tuning and Analysis Utilities ($TOOLCHAIN build)"
}
 
module-whatis "Tuning and Analysis Utilities ($TOOLCHAIN build)"
set basedir /share/apps/tau-$TOOLCHAIN

prepend-path PATH \$basedir/bin
prepend-path LIBRARY_PATH \$basedir/lib
prepend-path LD_RUN_PATH \$basedir/lib
EOF
