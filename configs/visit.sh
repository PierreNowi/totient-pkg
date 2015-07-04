#!/bin/sh
#
# VisIt visualization tool (binary)

source ./helper.sh
set_stage

module load anaconda
wgetl http://portal.nersc.gov/svn/visit/trunk/releases/2.9.2/build_visit2_9_2
chmod 755 build_visit2_9_2
./build_visit2_9_2 --console --mesa

cd visit2.9.2/src/
make package
svn_bin/visit-install 2_9_2 linux-x86_64 $PREFIX/visit

leave_stage
