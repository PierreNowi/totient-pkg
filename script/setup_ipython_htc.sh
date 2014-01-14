#!/bin/sh

if [ -d "$HOME/.ipython/profile_htc" ]; then
  echo "HTCondor profile already exists"
  exit 0
fi

ipython profile create --parallel --profile=htc

PDIR=$HOME/.ipython/profile_htc
IPENGINE=`which ipengine`

cat > $PDIR/batch_submit <<EOF
universe            = vanilla
executable          = $IPENGINE
transfer_executable = false
getenv              = true
notification        = never
arguments       = "--log-to-file '--profile-dir=$HOME/.ipython/profile_htc' '--cluster-id='"

queue {n}
EOF

cat > $PDIR/ipcluster_config.py <<EOF
c = get_config()
c.IPClusterStart.engine_launcher_class = 'HTCondorEngineSetLauncher'
c.HTCondorEngineSetLauncher.batch_template_file = u'$HOME/.ipython/profile_htc/batch_submit'
EOF

cat > $PDIR/ipcontroller_config.py <<EOF
c = get_config()
c.HubFactory.ip = '*'
EOF

