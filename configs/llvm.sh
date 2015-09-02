#!/bin/sh
#
# LLVM
#
# DSB: Note that gcc_personality_v0 in 3.6.1 has a problem --
#   the call to _Unwind_GetLanguageSpecificData in
#   llvm/projects/compiler-rt/lib/builtins/gcc_personality_v0.c
#   requires a cast to uint8_t*
#
VER=3.6.2
STZ=$VER.src.tar.xz
BASE_URL=http://llvm.org/releases/$VER

function wget_llvm () {
  wgetl $BASE_URL/$1-$VER.src.tar.xz
  tar -xJf $1-$VER.src.tar.xz
  mv $1-$VER.src $2
}

source ./helper.sh $*
set_stage
module load anaconda
export LD_LIBRARY_PATH=$HOME/local/anaconda/lib:$LD_LIBRARY_PATH

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

../configure -prefix=$PREFIX/llvm-$VER-gcc-4.9.2 \
  --with-gcc-toolchain=$PREFIX/gcc-4.9.2 \
  --with-extra-ld-options=-Wl,-R$PREFIX/gcc-4.9.2/lib64 \
  --enable-cxx11

make
make install

mkdir -p $PREFIX/llvm-$VER-analyzer-gcc-4.9.2/
cp -R ../tools/clang/tools/scan-build/* $PREFIX/llvm-$VER-analyzer-gcc-4.9.2/
cp -R ../tools/clang/tools/scan-view/*  $PREFIX/llvm-$VER-analyzer-gcc-4.9.2/

leave_stage
