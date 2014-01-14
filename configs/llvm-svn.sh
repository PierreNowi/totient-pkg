#!/bin/sh
#
# LLVM

URL=http://llvm.org/svn/llvm-project/

source $HOME/pkg/configs/helper.sh
set_stage
module load cs5220

svn co $URL/llvm/trunk llvm

pushd llvm/tools
svn co $URL/cfe/trunk clang
svn co $URL/lldb/trunk lldb
popd

pushd llvm/tools/clang/tools
svn co $URL/clang-tools-extra/trunk extra
svn co $URL/polly/trunk polly
popd

pushd llvm/projects
svn co $URL/compiler-rt/trunk compiler-rt
popd

cd llvm
mkdir build
cd build

module unload anaconda

../configure -prefix=$PREFIX/llvm-svn \
  --with-gcc-toolchain=$PREFIX/gcc-4.8.2 \
  --with-extra-ld-options=-Wl,-R$PREFIX/gcc-4.8.2/lib64 \
  --enable-cxx11

make
make install

mkdir -p $PREFIX/llvm-svn-analyzer/
cp -R ../tools/clang/tools/scan-build/* $PREFIX/llvm-$VER-analyzer/
cp -R ../tools/clang/tools/scan-view/*  $PREFIX/llvm-$VER-analyzer/

leave_stage
