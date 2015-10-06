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
module load pdt

set basedir /share/apps/tau-$TOOLCHAIN

setenv TAU_MAKEFILE \$basedir/include/Makefile

prepend-path PATH \$basedir/bin
prepend-path PATH \$basedir/x86_64/bin
prepend-path LIBRARY_PATH \$basedir/lib
prepend-path LIBRARY_PATH \$basedir/x86_64/lib
prepend-path LD_RUN_PATH \$basedir/lib
prepend-path LD_RUN_PATH \$basedir/x86_64/lib
EOF
