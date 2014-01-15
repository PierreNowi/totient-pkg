#!/bin/sh
#
# setup_ipython_nbserver.sh port
#
# Set up a notebook server profile associated with a well-known port.
#
# See instructions at
#   http://ipython.org/ipython-doc/dev/interactive/public_server.html

if [ $# -ne 1 ]; then
  echo "Usage: setup_ipython_nbserver.sh port"
  exit 1
fi

if [ -d "$HOME/.ipython/profile_nbserver" ]; then
  echo "nbserver profile already exists"
  exit 0
fi

ipython profile create nbserver
PDIR=$HOME/.ipython/profile_nbserver

python -c "from IPython.lib import passwd; print passwd()" \
	> $PDIR/nbpasswd.txt

cat > $PDIR/ipython_notebook_config.py <<EOF
# Notebook configuration
c = get_config()

# Kernel configuration
c.IPKernelApp.pylab = 'inline'  # Always turn on plotting supoprt

# Notebook config
c.NotebookApp.ip = '*'
c.NotebookApp.open_browser = False
c.NotebookApp.port = $1

PWDFILE="$PDIR/nbpasswd.txt"
c.NotebookApp.password = open(PWDFILE).read().strip()
EOF

