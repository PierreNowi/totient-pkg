# c4-pkg

This is a set of configuration scripts for maintaining my personal
software builds on the C4 cluster, with the hopes that I will be able
to keep things up to date without going completely bonkers.  The
scripts grab the various packages from the web or a local downloads
folder, or they clone a git repository, or what have you.  Then the
configure and build out of `/tmp` and run locally.  The `do_all.sh`
command runs all the package installs, so I should be able to nuke
my personal `local` directory and start over if I get into trouble.
