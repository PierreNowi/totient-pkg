MDIRS=devtoolset python psxe gcc openmpi openblas lapack boost suitesparse
MODULES= \
	cs5220 \
	utils \
	anaconda \
	devtoolset/3 \
	python/2.7 \
	python/3.4.3 \
	psxe/2015 \
	gcc/5.2.0 \
	openmpi/1.8.8-gcc-4.4.7 \
        openmpi/1.10.0-gcc-4.9.2 \
        openmpi/1.10.0-gcc-5.2.0 \
	openblas/gcc-4.9.2 \
	openblas/gcc-5.2.0 \
	lapack/3.5.0-gcc-4.9.2 \
	lapack/3.5.0-gcc-5.2.0 \
	boost/1.59.0-gcc-4.9.2 \
	suitesparse/4.4.5-gcc-4.9.2

.PHONY: all install local

all:
	echo "targets: install or local"

install:
	for p in $(MDIRS) ; do mkdir -p /share/modulefiles/$$p ; done
	for f in $(MODULES) ; do \
		p=`echo $$f | sed 's/[/].*$$//'` ; \
		install -m 644 -D $$f /share/modulefiles/$$p ; \
	done

local:
	for p in $(MDIRS) ; do mkdir -p $(HOME)/privatemodules/$$p ; done
	for f in $(MODULES) ; do \
		p=`echo $$f | sed 's/[/].*$$//'` ; \
		install -m 644 -D $$f $(HOME)/privatemodules/$$p ; \
	done

