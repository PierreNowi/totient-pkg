# Build scripts

These scripts grab a tarball or source repository, patch and configure it,
build it in a temporary directory, and install.  Common code is in `helper.sh`.
The default prefix for installations and staging area for builds can be set
by environment variables or by editing ths script.

The `do_init.sh` script installs enough to get `tmux` working so that the rest
can be done from a `tmux` session without maintaining an active ssh connection.
The `do_all.sh` script runs the full install.
