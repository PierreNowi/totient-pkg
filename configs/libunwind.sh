#/bin/sh
#
# libunwind -- stack unwinding support
# http://www.nongnu.org/libunwind/

source ./helper.sh $*
stage_dl_ac http://download.savannah.gnu.org/releases/libunwind/libunwind-1.1.tar.gz \
	--prefix=$PREFIX/utils
