#!/bin/bash

# Exit on first error
set -e

# Install under cs-instructional 
if [ -z "$PREFIX" ]; then
  PREFIX=/share/cs-instructional/cs5220/local
fi

# Staging location
if [ -z "$STAGING" ]; then
  STAGING=/state/partition1/dsb253_temp/staging
fi

# C4-pkg location
if [ -z "$C4_PKG" ]; then
  C4_PKG=`pwd`/../
fi

# Report variable setup
echo "# ======================="
echo "PREFIX= $PREFIX"
echo "STAGING=$STAGING"
echo "C4_PKG= $C4_PKG"
echo "# ======================="

#
# Set up and clear out staging area
#
function set_stage() {
  if [ -f $C4_PKG/stamp/$0-stamp ] ; then
    echo "Already built $0.  Kill timestamp to force rebuild"
    cat $C4_PKG/stamp/$0-stamp
    exit 0
  fi
  echo "Clearing staging area"
  mkdir -p $STAGING
  pushd $STAGING
  rm -rf *
  return 0
}

#
# Leave the staging area
#
function leave_stage () {
  echo "Marking as done"
  mkdir -p $C4_PKG/stamp
  date > $C4_PKG/stamp/$0-stamp
  echo "Leaving staging area"
  popd
  return 0
}

#
# wgetl URL
#
function wgetl () {
  local TARBALL=`echo $1 | sed 's/^.*\///'`
  echo $TARBALL
  if [ ! -f $C4_PKG/archives/$TARBALL ]; then
    mkdir -p $C4_PKG/archives
    pushd $C4_PKG/archives/
    wget $1
    popd
  fi
  cp $C4_PKG/archives/$TARBALL .
  return 0
}

#
# set_stage_dl URL DIRNAME
# (second option is optional)
#
function set_stage_dl () {
  set_stage

  # Fetch the repository
  local TARBALL=`echo $1 | sed 's/^.*\///'`
  if echo $TARBALL | grep -q '[.]git$' ; then
    echo "Fetching git file $1"
    git clone $1
  elif echo $TARBALL | grep -q '[.]gz$' ; then
    echo "Fetching $TARBALL"
    wgetl $1
    mkdir tmp
    cd tmp
    tar -xzf ../$TARBALL
  elif echo $TARBALL | grep -q '[.]tgz$' ; then
    echo "Fetching $TARBALL"
    wgetl $1
    mkdir tmp
    cd tmp
    tar -xzf ../$TARBALL
  elif echo $TARBALL | grep -q '[.]bz2$' ; then
    echo "Fetching $TARBALL"
    wgetl $1
    mkdir tmp
    cd tmp
    tar -xjf ../$TARBALL
  fi

  # Set the dirname (if not already set)
  if [ -z $2 ]; then
    export DIRNAME=`ls`
  fi

  # Change to subdirectory
  cd `ls`

  return 0
}

#
# stage_dl_ac URL OPTS
# Stage and download with autoconf
#
function stage_dl_ac() {
  set_stage_dl $1
  shift
  if echo "$@" | grep "prefix" ; then
    prefix_opt=""
  else
    prefix_opt="--prefix $PREFIX"
  fi
  ./configure $prefix_opt $@
  make
  make install
  leave_stage
  return 0
}

#
# run_dl_ac URL DIRNAME
# Download with autoconf, assuming stage already set
#
function run_dl_ac () {
  rm -rf *

  # Fetch the repository
  local TARBALL=`echo $1 | sed 's/^.*\///'`
  if echo $TARBALL | grep -q '[.]git$' ; then
    echo "Fetching git file $1"
    git clone $1
  elif echo $TARBALL | grep -q '[.]gz$' ; then
    echo "Fetching $TARBALL"
    wgetl $1
    mkdir tmp
    cd tmp
    tar -xzf ../$TARBALL
  elif echo $TARBALL | grep -q '[.]tgz$' ; then
    echo "Fetching $TARBALL"
    wgetl $1
    tar -xzf ../$TARBALL
  elif echo $TARBALL | grep -q '[.]bz2$' ; then
    echo "Fetching $TARBALL"
    wgetl $1
    mkdir tmp
    cd tmp
    tar -xjf ../$TARBALL
  fi

  # Set the dirname (if not already set)
  if [ -z $2 ]; then
    export DIRNAME=`ls`
  fi

  # Change to subdirectory
  cd `ls`

  # Run the build
  shift
  if echo "$@" | grep "prefix" ; then
    prefix_opt=""
  else
    prefix_opt="--prefix $PREFIX"
  fi
  ./configure $prefix_opt $@
  make
  make install

  return 0
}
