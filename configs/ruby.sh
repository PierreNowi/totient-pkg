#!/bin/sh
#
# Ruby

source ./helper.sh $*
stage_dl_ac \
	https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.3.tar.gz \
	--prefix=$PREFIX/ruby-2.2.3
