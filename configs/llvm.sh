#!/bin/sh
#
# LLVM

VER=3.3
STZ=$VER.src.tar.gz
BASE_URL=http://llvm.org/releases/$VER

function wget_llvm () {
  wgetl $BASE_URL/$1-$VER.src.tar.gz
  tar -xzf $1-$VER.src.tar.gz
  mv $1-$VER.src $2
}

source $HOME/pkg/configs/helper.sh
set_stage

wget_llvm llvm llvm

pushd llvm/tools
wget_llvm cfe clang
wget_llvm lldb lldb
popd

pushd llvm/tools/clang/tools
wget_llvm clang-tools-extra extra
wget_llvm polly polly
popd

pushd llvm/projects
wget_llvm compiler-rt compiler-rt
popd

cd llvm
mkdir build
cd build

module unload anaconda
CC=/share/cs-instructional/cs5220/local/gcc-4.8.2/bin/gcc \
CXX=/share/cs-instructional/cs5220/local/gcc-4.8.2/bin/g++ \
../configure -prefix=$PREFIX/llvm-$VER --enable-cxx11

#CC=/share/cs-instructional/cs5220/local/gcc-4.8.2/bin/gcc \
#CXX=/share/cs-instructional/cs5220/local/gcc-4.8.2/bin/g++ \
#cmake .. \
#  -DCMAKE_INSTALL_PREFIX=$PREFIX/llvm-$VER \
#  -DLLVM_ENABLE_CXX11=ON \
#  -DPYTHON_LIBRARY=$PREFIX/anaconda/lib/libpython2.7.so 

make
make install

leave_stage
