# totient-pkg

This is a set of configuration scripts for maintaining the software
system for class use on the Totient cluster.  The base OS on the
cluster (RHEL 6.7) uses relatively old versions of binutils, GCC,
and several other things, so some updates are needed.

The scripts grab packages from the web or from a local downloads
folder, or clone a repository.  They configure and build out of a
staging directory, and install into the shared subdirectory.  The
basic structure is:

* `toolchain`: base configuration scripts for GCC/Intel toolchains
* `configs`: configuration scripts for building the packages
* `modules`: module definitions and generators

In addition, there are:

* `stamp.yml`: time stamps used to track which packages are built
* `archives`: directory of saved tarballs (avoid re-downloading)

