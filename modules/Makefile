MDIRS=devtoolset python psxe gcc upc maqao libelf
MODULES= \
	cs5220 \
	utils \
	anaconda \
	devtoolset/3 \
	python/2.7 \
	python/3.4.3 \
	psxe/2015 \
	gcc/5.2.0 \
	upc/2.20.2 \
	maqao/2.1.1 \
	libelf/0.163

.PHONY: install build

install: build
	for p in $(MDIRS) ; do mkdir -p /share/modulefiles/$$p ; done
	for f in $(MODULES) ; do \
		p=`echo $$f | sed 's/[/].*$$//'` ; \
		install -m 644 -D $$f /share/modulefiles/$$p ; \
	done

build:
	./build.sh openblas gcc-4.9.2 
	for tc in gcc-4.9.2 icc-15.0.3 ; do \
	./build.sh openmpi $$tc 1.10.0 ; \
	./build.sh lapack $$tc 3.5.0 ; \
	./build.sh boost $$tc 1.59.0 ; \
	./build.sh suitesparse $$tc 4.4.5 ; \
	./build.sh metis $$tc 5.1.0 ; \
	./build.sh fftw $$tc 3.3.4 ; \
	./build.sh eigen $$tc 3.2.5 ; \
	./build.sh armadillo $$tc 5.200.2 ; \
	./build.sh gsl $$tc 1.16 ; \
	./build.sh ipm $$tc latest ; \
	./build.sh pdt $$tc 3.20 ; \
	./build.sh tau $$tc latest ; \
	done
	./build.sh hdf5   generic 1.8.13 
	./build.sh netcdf generic 4.3.3.1 
	./build.sh matio  generic 1.5.2 
	./build.sh llvm   generic 3.6.2
	./build.sh llvm   generic 3.7.0
	./build.sh llvm-analyzer generic 3.6.2
	./build.sh llvm-analyzer generic 3.7.0
	./build.sh gperftools generic 2.4
