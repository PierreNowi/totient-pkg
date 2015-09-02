#!/bin/sh
#
# NetCDF module generation
#
cat <<EOF
#%Module1.0
proc ModulesHelp { } {
  global dotversion
  puts stderr "NetCDF $VER ($TOOLCHAIN build)"
}
 
module-whatis "NetCDF $VER ($TOOLCHAIN build)"
set basedir /share/apps/netcdf-$VER-$TOOLCHAIN

prepend-path CPATH \$basedir/include
prepend-path LIBRARY_PATH \$basedir/lib
prepend-path LD_RUN_PATH \$basedir/lib
EOF
