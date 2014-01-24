#!/bin/sh
set -e

# -- Start off with rpaths set appropriately
module load cs5220-base

# -- tmux lets us finish rebuilding without a window
./libevent.sh
./tmux.sh

