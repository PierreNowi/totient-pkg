#!/bin/sh
#
# Set up wrappers around gcc/g++/gfortran

VER=gcc-4.9.3
source ./helper.sh
set_stage

# Write a wrapper around a driver (adds rpath entries)
function write_wrapper() {
cat > $PREFIX/$VER/bin/$1 <<EOF
#!/bin/sh
GCC_WRAPPER_DIRS="$PREFIX/$VER/lib64 $PREFIX/lib64 $PREFIX/lib" 
GCC_WRAPPER_LD_RUN_PATH=\`echo "\$LD_RUN_PATH" | sed 's/:/ /g'\` 
GCC_WRAPPER_DIRS="\$GCC_WRAPPER_LD_RUN_PATH \$GCC_WRAPPER_DIRS"
for dname in \$GCC_WRAPPER_DIRS ; do
  GCC_WRAPPER_ARGS="\$GCC_WRAPPER_ARGS -Wl,-rpath -Wl,\$dname"
done

for arg in \$@ ; do
  if [ "\$arg" == "-v" ]; then
    GCC_WRAPPER_ARGS=""
  elif [ "\$arg" == "-c" ]; then
    GCC_WRAPPER_ARGS=""
  elif [ "\$arg" == "-s" ]; then
    GCC_WRAPPER_ARGS=""
  fi
done

if [ \$# -eq 0 ]; then
  GCC_WRAPPER_ARGS=""
fi

exec $PREFIX/$VER/bin/$1-4.9.3 "\$@" \$GCC_WRAPPER_ARGS
EOF
chmod +x $PREFIX/$VER/bin/$1
}

# Write wrappers for all three languages
for driver in gcc g++ c++ gfortran ; do
  write_wrapper $driver
done

# Symlink for preproc
rm -f $PREFIX/$VER/bin/cpp
ln -s $PREFIX/$VER/bin/cpp-4.9.3 $PREFIX/$VER/bin/cpp

leave_stage
