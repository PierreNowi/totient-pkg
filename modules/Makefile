MDIRS=devtoolset python psxe gcc openmpi openblas lapack boost suitesparse
MODULES= \
	cs5220 \
	utils \
	anaconda \
	devtoolset/3 \
	python/2.7 \
	python/3.4.3 \
	psxe/2015 \
	gcc/5.2.0 

.PHONY: install build

install: build
	for p in $(MDIRS) ; do mkdir -p /share/modulefiles/$$p ; done
	for f in $(MODULES) ; do \
		p=`echo $$f | sed 's/[/].*$$//'` ; \
		install -m 644 -D $$f /share/modulefiles/$$p ; \
	done

build:
	./build.sh openmpi gcc-4.9.2  1.10.0
	./build.sh openmpi icc-15.0.3 1.10.0
	./build.sh openblas gcc-4.9.2
	./build.sh openblas icc-15.0.3
	./build.sh lapack gcc-4.9.2  3.5.0
	./build.sh lapack icc-15.0.3 3.5.0
	./build.sh boost gcc-4.9.2  3.5.0
	./build.sh boost icc-15.0.3 3.5.0
	./build.sh suitesparse gcc-4.9.2  4.4.5
	./build.sh suitesparse icc-15.0.3 4.4.5
