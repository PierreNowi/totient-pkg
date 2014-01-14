# c4-pkg

This is a set of configuration scripts for maintaining the software system for
CS 5220 on the C4 cluster.  The scripts grab packages from the web or from a
local downloads folder, or clone a repository.  They configure and build out of
a staging directory, and install into the shared subdirectory.  The basic
structure is:

* `configs`: configuration scripts for building the packages
* `script`: common local scripts (separate from external packages)
* `modules`: module definitions

In addition, there are two auxiliary scratch directories:

* `stamp`: time stamps used to track which packages are built
* `archives`: saved tarballs (avoid re-downloading)

