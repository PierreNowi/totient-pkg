#!/bin/sh
#
# tmux -- a terminal multiplexer
# http://tmux.sourceforge/net/

DIRNAME=tmux-1.8
TARBALL=$DIRNAME.tar.gz
URL=http://downloads.sourceforge.net/project/tmux/tmux/tmux-1.8/$TARBALL

source $HOME/pkg/configs/helper.sh
set_stage
wgetl $URL
tar -xzf $TARBALL
cd $DIRNAME
./configure --prefix=$PREFIX 
make
make install
leave_stage
