#!/bin/sh
#
# IACA (Intel Adrchitecture Code Analyzer)
# Have to make this 

source ./helper.sh $*
set_stage

wgetl iaca-lin64.zip
unzip iaca-lin64.zip
mv iaca-lin64 /share/apps/iaca-2.1-lin64

leave_stage
