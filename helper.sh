#!/bin/sh

PREFIX=$HOME/local
STAGING=/tmp/dsb253-build

#
# Set up and clear out staging area
#
function set_stage() {
  if [ -f $HOME/pkg/stamp/$0-stamp ] ; then
    echo "Already built $0.  Kill timestamp to force rebuild"
    cat $HOME/pkg/stamp/$0-stamp
    exit 0
  fi
  echo "Clearing staging area"
  mkdir -p $STAGING
  pushd $STAGING
  rm -rf *
}

#
# Leave the staging area
#
function leave_stage () {
  echo "Marking as done"
  date > $HOME/pkg/stamp/$0-stamp
  echo "Leaving staging area"
  popd
}

#
# wgetl URL
#
function wgetl () {
  TARBALL=`echo $1 | sed 's/^.*\///'`
  echo $TARBALL
  if [ ! -f $HOME/pkg/archives/$TARBALL ]; then
    pushd $HOME/pkg/archives/
    wget $1
    popd
  fi
  cp $HOME/pkg/archives/$TARBALL .
}
