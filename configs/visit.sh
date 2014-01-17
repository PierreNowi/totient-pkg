#!/bin/sh
#
# VisIt visualization tool (binary)

source ./helper.sh
set_stage

module load anaconda
wgetl http://portal.nersc.gov/svn/visit/trunk/releases/2.7.0/build_visit2_7_0
chmod 755 build_visit2_7_0
./build_visit2_7_0 --console --mesa

cd visit2.7.0/src/
make package
svn_bin/visit-install 2_7_0 linux-x86_64 $PREFIX/visit

leave_stage
