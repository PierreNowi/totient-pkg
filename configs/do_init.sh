#!/bin/sh
set -e

# -- tmux lets us finish rebuilding without a window
./libevent.sh
./tmux.sh

# -- Lua and module system
./lua.sh
./lrocks.sh
./ldoc.sh

