#!/bin/sh
#
# IACA (Intel Adrchitecture Code Analyzer)
# Have to make this 

source ./helper.sh $*
set_stage

export IACA=$PREFIX/iaca-2.1-lin64

wgetl iaca-lin64.zip
unzip iaca-lin64.zip
mv iaca-lin64 $IACA

# Unfortunately, IACA requires at least libstdc++3.14.15
# RHEL6 is a few steps behind.  This is also an issue for Chrome,
# so we steal someone else's up-to-date libstdc++ and patch
# the ELF header for IACA
#
wgetl http://chrome.richardlloyd.org.uk/libstdc++.so.6.xz
xz -d libstdc++.so.6.xz
mv libstdc++.so.6 $IACA/lib
patchelf --set-rpath '$ORIGIN/../lib' $IACA/bin/iaca

leave_stage
