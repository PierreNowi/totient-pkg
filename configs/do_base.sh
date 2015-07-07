#!/bin/sh
set -e

# -- Start with a clean slate
module purge

# -- Build Lua and module system
./lua.sh
./lrocks.sh
./ldoc.sh

# -- Build out easybuild system
./easybuild.sh

# -- Now give user directions
cat <<EOF
Installed Lmod and easybuild.  Change to ../scripts and run make
to install scripts under HOME/local; then add HOME/local/magma-base.sh
to the bash profile.
EOF
