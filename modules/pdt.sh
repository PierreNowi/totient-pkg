#!/bin/sh
#
# Generate PDT modules
#
cat <<EOF
#%Module1.0
proc ModulesHelp { } {
  global dotversion
  puts stderr "Program Database Toolkit ($TOOLCHAIN build)"
}
 
module-whatis "Program Database Toolkit ($TOOLCHAIN build)"
set basedir /share/apps/pdt-3.20-$TOOLCHAIN

prepend-path PATH \$basedir/bin
prepend-path LIBRARY_PATH \$basedir/lib
prepend-path LD_RUN_PATH \$basedir/lib
EOF
