#!/bin/sh

# Install under cs-instructional with appropriate group
PREFIX=/share/cs-instructional/cs5220/local
group=en-cc-c4-cs-instructional
if [ $(id -gn) != $group ]; then
  exec sg $group "$0 $*"
fi

# Staging location
STAGING=/state/partition1/dsb253_temp

# Environment setup
source /share/cs-instructional/cs5220/vars.sh

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
  mkdir -p $HOME/pkg/stamp
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
    mkdir -p $HOME/pkg/archives
    pushd $HOME/pkg/archives/
    wget $1
    popd
  fi
  cp $HOME/pkg/archives/$TARBALL .
}
