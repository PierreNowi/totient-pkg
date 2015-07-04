#!/bin/sh
#
# gperftools + libunwind
# https://code.google.com/p/gperftools/
#
# Comment: This is going into its own module, since I've been reading
# things about gperftools causing trouble with x86_64 partly due to trouble
# with libunwind -- given that I probably want to use the not-most-recent
# version, it probably makes sense.


# libunwind
UDIRNAME=libunwind-0.99-beta
UTARBALL=$UDIRNAME.tar.gz
UURL=http://download.savannah.gnu.org/releases/libunwind/$UTARBALL

# gperftools
DIRNAME=gperftools-2.4
TARBALL=$DIRNAME.tar.gz
URL=https://gperftools.googlecode.com/files/$TARBALL

source ./helper.sh
set_stage

wgetl $UURL
wgetl $URL
tar -xzf $UTARBALL
tar -xzf $TARBALL

cd $UDIRNAME
./configure --prefix=$PREFIX/$DIRNAME
make
make install
cd ..

export LD_RUN_PATH=$PREFIX/$DIRNAME/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$PREFIX/$DIRNAME/lib:$LIBRARY_PATH
export CPATH=$PREFIX/$DIRNAME/include:$CPATH
cd $DIRNAME
./configure --prefix=$PREFIX/$DIRNAME
make
make install
cd ..

leave_stage
