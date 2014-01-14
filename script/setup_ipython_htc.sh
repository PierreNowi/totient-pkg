#!/bin/sh

if [ -d "$HOME/.ipython/profile_htc" ]; then
  echo "HTCondor profile already exists"
  exit 0
fi

ipython profile create --parallel --profile=htc
pushd $HOME/.ipython/profile_htc

echo > batch_submit <<EOF
universe        = vanilla
executable      = /share/cs-instructional/cs5220/local/anaconda/bin/ipengine
transfer_executable = False
getenv = True
notification = never
arguments       = "--log-to-file '--profile-dir=$HOME/.ipython/profile_htc' '--cluster-id='"

queue {n}
EOF

echo > ipcluster_config.py <<EOF
c = get_config()
c.IPClusterStart.engine_launcher_class = 'HTCondorEngineSetLauncher'
c.HTCondorEngineSetLauncher.batch_template_file = u'$HOME/.ipython/profile_htc/batch_submit'
EOF

echo > ipcontroller_config.py <<EOF
c = get_config()
c.HubFactory.ip = '*'
EOF

popd
