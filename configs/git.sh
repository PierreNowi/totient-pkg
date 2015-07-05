#!/bin/sh
#
# git

source ./helper.sh
set_stage_dl https://github.com/git/git/archive/v2.4.5.tar.gz

make prefix=$PREFIX all install

leave_stage
