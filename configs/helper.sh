#!/bin/bash

PYTHON=/share/apps/python/anaconda/bin/python

# Exit on first error
set -e

# Install under /share/apps
if [ -z "$PREFIX" ]; then
  PREFIX=/share/apps
fi

# Staging location
if [ -z "$STAGING" ]; then
  STAGING=/tmp/dsb253/staging
fi

# totient-pkg location
if [ -z "$TOTIENT_PKG" ]; then
  TOTIENT_PKG=`pwd`/../
fi

# Build tag
if [ -z "$BUILD_TAG" ]; then
  BUILD_TAG="generic"
fi

# Report variable setup
echo "# ======================="
echo "PREFIX= $PREFIX"
echo "STAGING=$STAGING"
echo "TOTIENT_PKG=$TOTIENT_PKG"
echo "BUILD_TAG=$BUILD_TAG"
echo "# ======================="


#
# Add, remove, or test a stamp
#
function stamp() {
  stamp=`echo $0 | sed -e 's/.sh$//' | sed -e 's/.*[/]//'`-$BUILD_TAG
  echo $1 $stamp
  $PYTHON $TOTIENT_PKG/configs/check_stamp.py $TOTIENT_PKG/stamp.yml $1 $stamp
}

#
# Set up and clear out staging area
#
function set_stage() {
  #if [ -f $TOTIENT_PKG/stamp/$0-stamp ] ; then
  if stamp test ; then
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
  stamp add
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
  if [ ! -f $TOTIENT_PKG/archives/$TARBALL ]; then
    mkdir -p $TOTIENT_PKG/archives
    pushd $TOTIENT_PKG/archives/
    wget $1
    popd
  fi
  cp $TOTIENT_PKG/archives/$TARBALL .
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
  elif echo $TARBALL | grep -q '[.]zip$' ; then
    echo "Fetching $TARBALL"
    wgetl $1
    mkdir tmp
    cd tmp
    unzip ../$TARBALL
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

#
# stage_dl_cmake URL OPTS
# Stage and download with CMake
#
function stage_dl_cmake() {
  set_stage_dl $1
  shift
  if echo "$@" | grep "DCMAKE_INSTALL_PREFIX" ; then
    install_prefix_opt=""
  else
    install_prefix_opt="-DCMAKE_INSTALL_PREFIX=$PREFIX"
  fi
  if echo "$@" | grep "DCMAKE_PREFIX_PATH" ; then
    prefix_opt=""
  else
    prefix_opt="-DCMAKE_PREFIX_PATH=$PREFIX"
  fi
  mkdir build
  cd build
  cmake $install_prefix_opt $prefix_opt $@ ..
  make
  make install
  leave_stage
  return 0
}

