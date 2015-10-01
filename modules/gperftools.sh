#!/bin/sh
#
# gperftools module generation
#
cat <<EOF
#%Module1.0
proc ModulesHelp { } {
  global dotversion
  puts stderr "gperftools $VER ($TOOLCHAIN build)"
}
 
module-whatis "gperftools $VER ($TOOLCHAIN build)"
set basedir /share/apps/gperftools-$VER-$TOOLCHAIN

prepend-path CPATH \$basedir/include
prepend-path LIBRARY_PATH \$basedir/lib
prepend-path LD_RUN_PATH \$basedir/lib
prepend-path MAN_PATH \$basedir/share/man
EOF
