MAGMA_BASE=$HOME/local
ANACONDA=$MAGMA_BASE/anaconda
LMOD=$MAGMA_BASE/lmod/lmod

# Clear system module setup

module purge
unset module

# Add anaconda base dirs

export PATH=$ANACONDA/bin:$PATH
export LIBRARY_PATH=$ANACONDA/lib:$LIBRARY_PATH
export LD_RUN_PATH=$ANACONDA/lib:$LD_RUN_PATH

# Add base directories

export PATH=$MAGMA_BASE/bin:$PATH
export CPATH=$MAGMA_BASE/include:$CPATH
export LIBRARY_PATH=$MAGMA_BASE/lib:$MAGMA_BASE/lib64:$LIBRARY_PATH
export LD_RUN_PATH=$MAGMA_BASE/lib:$MAGMA_BASE/lib64:$LD_RUN_PATH
export MANPATH=$MAGMA_BASE/man:$MANPATH

export LUA_PATH="$MAGMA_BASE/share/lua/5.3/?.lua;$MAGMA_BASE/share/lua/5.3/?/init.lua"
export LUA_CPATH="$MAGMA_BASE/lib/lua/5.3/?.so"

# Add Lua module system

MODULEPATH=$MAGMA_BASE/modules
source $LMOD/init/bash

