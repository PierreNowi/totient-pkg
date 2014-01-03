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

#CC=gcc-4.8 CXX=g++-4.8 
cmake .. \
  -DCMAKE_INSTALL_PREFIX=$PREFIX/llvm \
  -DLLVM_ENABLE_CXX11=ON \
  -DPYTHON_LIBRARY=$PREFIX/anaconda/lib/libpython2.7.so 

make
make install

leave_stage
