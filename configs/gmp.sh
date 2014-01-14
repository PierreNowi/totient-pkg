#!/bin/sh
#
# GMP -- GNU Multiprecision Library
# http://gmplib.org/

source ./helper.sh
stage_dl_ac ftp://ftp.gnu.org/gnu/gmp/gmp-5.1.3.tar.bz2 --enable-cxx
