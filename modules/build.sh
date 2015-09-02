#!/bin/sh
#
# Generate module file from shell script output
#
export TOOLCHAIN=$2
export VER=$3
export BUILD_TAG=$VER-$TOOLCHAIN
mkdir -p /tmp/dsb253/module
mkdir -p /share/modulefiles/$1
source ./$1.sh > /tmp/dsb253/module/tmp.txt
mv /tmp/dsb253/module/tmp.txt /share/modulefiles/$1/$BUILD_TAG
chmod 644 /share/modulefiles/$1/$BUILD_TAG

